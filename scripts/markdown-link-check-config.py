import os
import json
import re


def main():
  config = {
    'projectBaseUrl': '${projectDirectory}',
    'ignorePatterns': [
      {
        'pattern': 'https://home.stjude.org'
      },
      {
        'pattern': 'https://viz.stjude.cloud/signin'
      },
      {
        'pattern': 'https://aacrjournals.org*'
      },
      {
        'pattern': 'https://proteinpaint.stjude.org*'
      },
      {
        'pattern': 'https://doi.org*'
      },
      {
        'pattern': 'https://doi.org*'
      },
      {
        'pattern': 'https://academic.oup.com*'
      },
      {
        'pattern': 'https://ascopubs.org*'
      },
      {
        'pattern': 'https://pnas.org*'
      },
      {
        'pattern': 'https://nejm.org*'
      }
    ],
    'replacementPatterns': [
      {
        'pattern': '^/img/(?<filename>.*)',
        'replacement': '{{BASEURL}}/public/img/$<filename>'
      },
      {
        'pattern': '^/files/(?<filename>.*)',
        'replacement': '{{BASEURL}}/public/files/$<filename>'
      }
    ],
    'httpHeaders': [
      {
        'urls': ['https://platform.stjude.cloud', 'https://pecan.stjude.cloud', 'https://ensembl.org'],
        'headers': {
          'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'
        }
      }
    ],
    'timeout': '45s'
  }

  for root, dirs, files in os.walk("content"):
    path = root.split(os.sep)
    if len(path) == 1:
      continue

    for file in files:
      if file == '_dir.yml':
        continue

      pattern = re.sub(r'\d+\.', '', '^' + os.sep + f'{os.sep}'.join(path[1:]) + os.sep + file)
      replacement = '{{BASEURL}}' + os.sep + f'{os.sep}'.join(path) + os.sep + file

      config['replacementPatterns'].append({'pattern': pattern[:-3], 'replacement': replacement})

  if os.path.exists('.mlc_config.ci.json'):
    os.remove('.mlc_config.ci.json')

  with open('.mlc_config.ci.json', 'w') as f:
    f.write(json.dumps(config, indent=2))
    f.write("\n")


if __name__ == "__main__":
  main()
