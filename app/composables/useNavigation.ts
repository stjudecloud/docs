import { createSharedComposable } from '@vueuse/core'

const _useNavigation = () => {
  const headerLinks = computed(() => {
    const route = useRoute()

    return [{
      label: 'St. Jude Cloud',
      description: 'Guides that span across St. Jude Cloud.',
      icon: 'sjc-icon:child-logo',
      to: '/overview',
      active: route.path.startsWith('/overview')
    }, {
      label: 'CC4K',
      description: 'Cancer classifications for kids.',
      icon: 'sjc-icon:sitemap',
      to: '/cc4k',
      active: route.path.startsWith('/cc4k')
    }, {label: 'Genomics Platform',
      description: 'Genomics data and bioinformatics workflows.',
      icon: 'sjc-icon:genomics-platform',
      to: '/genomics-platform',
      active: route.path.startsWith('/genomics-platform')
    }, {
      label: 'PeCan',
      description: 'Explore the pediatric cancer knowledgebase.',
      icon: 'sjc-icon:pecan',
      to: '/pecan',
      active: route.path.startsWith('/pecan')
    }, {
      label: 'Visualization Community',
      description: 'Create and share genomic visualizations.',
      icon: 'sjc-icon:viz',
      to: '/visualization-community',
      active: route.path.startsWith('/visualization-community')
    }]
  })

  return {
    headerLinks
  }
}

export const useNavigation = createSharedComposable(_useNavigation)
