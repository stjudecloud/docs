export default defineNuxtPlugin(() => {
  const appId = 'zxn8gz0o'

  window.Intercom = window.Intercom || function (...args: any[]) {
    ;(window.Intercom.q = window.Intercom.q || []).push(args)
  }

  const script = document.createElement('script')
  script.async = true
  script.src = `https://widget.intercom.io/widget/${appId}`

  document.head.appendChild(script)

  window.Intercom('boot', {
    app_id: appId
  })
})
