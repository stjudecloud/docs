import { createSharedComposable } from '@vueuse/core'

const _useNavigation = () => {
  const nuxtApp = useNuxtApp()
  const headerLinks = computed(() => {
    const route = useRoute()

    return [{
      label: 'St. Jude Cloud',
      description: 'Guides that span across St. Jude Cloud.',
      to: '/overview',
      active: route.path.startsWith('/overview')
    }, {
      label: 'Genomics Platform',
      description: 'Genomics data and bioinformatics workflows.',
      to: '/genomics-platform',
      active: route.path.startsWith('/genomics-platform')
    }, {
      label: 'PeCan',
      description: 'Explore the pediatric cancer knowledgebase.',
      to: '/pecan',
      active: route.path.startsWith('/pecan')
    }, {
      label: 'Visualization Community',
      description: 'Create and share genomic visualizations.',
      to: '/visualization-community',
      active: route.path.startsWith('/visualization-community')
    }]
  })

  return {
    headerLinks
  }
}

export const useNavigation = createSharedComposable(_useNavigation)
