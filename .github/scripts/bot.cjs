// List of owner who can control bot workflow
// IMPORTANT: Make sure usernames are lower-cased
// TODO: Read owners from OWNERS file.
const owners = [
  'kevin-benton'
]

module.exports = async ({ github, context }) => {
  if (
    context.eventName == 'issue_comment' &&
    context.payload.action == 'created'
  ) {
    await handleIssueCommentCreate({ github, context })
  } else {
    console.log(`[main] event ${context.eventName} not supported, exiting.`)
  }
}

async function handleIssueCommentCreate({ github, context }) {
  const payload = context.payload
  const issue = context.issue
  const username = context.actor.toLowerCase()
  const commentBody = ((payload.comment.body || '') + '').trim()

  console.log(`    Issue(owner/repo/number): ${issue.owner}/${issue.repo}/${issue.number}
    Actor(current username / id): ${username} / ${payload.comment.user.id}
    CommentID: ${payload.comment.id}
    CreatedAt: ${payload.comment.created_at}`
  )

  if (!commentBody || !commentBody.startsWith('/')) {
    // Not a command
    return
  }

  const commandParts = commentBody.split(/\s+/)
  const command = commandParts.shift()
  console.log(`    Command: ${command}`)

  // Commands that can be executed by anyone.
  // Example:
  // if (command == '/assign') {
  //   await . . .
  // }

  // Commands that can only be executed by owners.
  if (!owners.includes(username)) {
    console.log(
      `[handleIssueCommentCreate] user ${username} is not an owner, exiting.`
    )
    await commentUserNotAllowed(github, issue, username)
    return
  }

  switch (command) {
    case '/preview':
      await cmdPreview(github, issue)
      break
    case '/destroy':
      await cmdDestroy(github, issue)
      break
    default:
      console.log(
        `[handleIssueCommentCreate] command ${command} not found, exiting.`
      )
      break
  }
}

/**
 * Sends a comment when the user who tried triggering the bot action is not allowed to do so.
 * @param {*} github GitHub object reference
 * @param {*} issue GitHub issue object
 * @param {string} username GitHub user who commented
 */
async function commentUserNotAllowed(github, issue, username) {
  await github.rest.issues.createComment({
      owner: issue.owner,
      repo: issue.repo,
      issue_number: issue.number,
      body: `👋 @${username}, my apologies but I can't perform this action for you because your username is not in the allowlist in the file ${'`.github/scripts/bot.js`'}.`,
  })
}

/**
 * Creates a preview environment for this PR
 * @param {*} github GitHub object reference
 * @param {*} issue GitHub issue object
 */
async function cmdPreview(github, issue) {
  // Pull preview app template
  const template = await github.rest.repos.getContent({
    owner: issue.owner,
    repo: issue.repo,
    branch: issue.branch,
    path: 'deployment/preview/app.tmpl.yaml'
  })

  // Modify to match this PR
  const templateContent = Buffer.from(template.data.content, 'base64').toString('utf8')
  const previewContent = templateContent.replaceAll('${ENVIRONMENT}', issue.number)
  const encodedPreviewContent = Buffer.from(previewContent, 'utf8').toString('base64')

  // Push the file
  await github.rest.repos.createOrUpdateFileContents({
    owner: issue.owner,
    repo: issue.repo,
    branch: issue.branch,
    path: `deployment/preview/app-pr${issue.number}.yaml`,
    message: `ci: :rocket: creates preview environment for pr${issue.number}`,
    committer: {
      name: 'stjudecloud-cloudy',
      email: 'stjudecloud-cloudy@users.noreply.github.com'
    },
    content: encodedPreviewContent,
  })

  // Label with preview
  await github.rest.issues.addLabels({
    owner: issue.owner,
    repo: issue.repo,
    issue_number: issue.number,
    labels: [
      'preview'
    ]
  })
}

/**
 * Destroys the preview environment for this PR
 * @param {*} github GitHub object reference
 * @param {*} issue GitHub issue object
 */
async function cmdDestroy(github, issue) {
  // Pull preview app file
  const file = await github.rest.repos.getContent({
    owner: issue.owner,
    repo: issue.repo,
    branch: issue.branch,
    path: `deployment/preview/app-pr${issue.number}.yaml`,
  })

  // Remove the preview file
  await github.rest.repos.deleteFile({
    owner: issue.owner,
    repo: issue.repo,
    branch: issue.branch,
    path: `deployment/preview/app-pr${issue.number}.yaml`,
    sha: file.data.sha,
    message: `ci: :fire: removes preview environment for pr${issue.number}`,
    committer: {
      name: 'stjudecloud-cloudy',
      email: 'stjudecloud-cloudy@users.noreply.github.com'
    }
  })

  // Label with preview
  await github.rest.issues.deleteLabel({
    owner: issue.owner,
    repo: issue.repo,
    issue_number: issue.number,
    name: 'preview'
  })
}
