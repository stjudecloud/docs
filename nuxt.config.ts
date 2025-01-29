// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  extends: ['@nuxt/ui-pro'],

  modules: [
    '@nuxt/content',
    '@nuxt/eslint',
    '@nuxt/fonts',
    '@nuxt/image',
    '@nuxt/ui',
    '@nuxthq/studio',
    'nuxt-og-image',
    '@nuxt/icon'
  ],

  css: [
    './assets/css/main.css'
  ],

  content: {
    highlight: {
      langs: ["bash", "python", "js", "javascript", "json", "r"]
    }
  },

  hooks: {
    // Define `@nuxt/ui` components as global to use them in `.md` (feel free to add those you need)
    'components:extend': (components) => {
      const globals = components.filter(c => ['UButton', 'UIcon'].includes(c.pascalName))

      globals.forEach(c => c.global = true)
    }
  },

  colorMode: {
    disableTransition: false,
    preference: 'light'
  },

  nitro: {
    prerender: {
      routes: [
        '/'
      ],
      crawlLinks: true
    }
  },

  icon: {
    customCollections: [
      {
        prefix: 'sjc-icon',
        dir: './assets/sjc-icons'
      }
    ]
  },

  routeRules: {
    '/api/search.json': { prerender: true },
    '/': { redirect: '/overview', prerender: false },
    '/genomics-platform': { redirect: '/genomics-platform/overview', prerender: false },
    '/pecan': { redirect: '/pecan/overview/getting-started', prerender: false },
    '/visualization-community': { redirect: '/visualization-community/overview/what-is-visualization-community', prerender: false }
  },

  devtools: {
    enabled: true
  },

  typescript: {
    strict: false
  },

  future: {
    compatibilityVersion: 4
  },

  eslint: {
    config: {
      stylistic: {
        commaDangle: 'never',
        braceStyle: '1tbs'
      }
    }
  },

  compatibilityDate: '2024-07-11'
})
