export default defineAppConfig({
  ui: {
    primary: 'blue',
    gray: 'slate',
    footer: {
      bottom: {
        left: 'text-sm text-gray-500 dark:text-gray-400',
        wrapper: 'border-t border-gray-200 dark:border-gray-800'
      }
    }
  },
  seo: {
    siteName: 'St. Jude Cloud Docs'
  },
  header: {
    logo: {
      alt: 'St. Jude Cloud',
      light: 'icons/stjude-cloud-logo-full-dark.svg',
      dark: 'icons/stjude-cloud-logo-full.svg'
    },
    search: true,
    colorMode: true,
    links: []
  },
  footer: {
    credits: 'St. Jude Children\'s Research Hospital © 2025',
    links: [{
      icon: 'sjc-icon:genomics-platform',
      label: 'Genomics Platform',
      to: 'https://platform.stjude.cloud',
      target: '_blank'
    },
    {
      icon: 'sjc-icon:pecan',
      label: 'PeCan',
      to: 'https://pecan.stjude.cloud',
      target: '_blank'
    },
    {
      icon: 'sjc-icon:viz',
      label: 'Visualization Community',
      to: 'https://viz.stjude.cloud',
      target: '_blank'
    }]
  },
  toc: {
    title: 'Table of Contents',
    bottom: {
      title: 'Community',
      edit: 'https://github.com/stjudecloud/docs/edit/main/content',
      links: [{
        icon: 'i-heroicons-star',
        label: 'Star on GitHub',
        to: 'https://github.com/stjudecloud/docs',
        target: '_blank'
      }]
    }
  }
})
