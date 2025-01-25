<script setup lang="ts">
import type { NavItem } from '@nuxt/content'

const navigation = inject<Ref<NavItem[]>>('navigation')

const route = useRoute()
const { navPageFromPath } = useContentHelpers()
const { headerLinks } = useNavigation()

const links = computed(() => headerLinks.value ?? [])

const navigationLinks = computed(() => {
  const path = `/${route.params.slug?.[0]}`

  return mapContentNavigation(navPageFromPath(path, navigation.value)?.children || [])
})

</script>

<template>
  <UContainer>
    <UPage>
      <template #left>
        <UAside>
          <UAsideLinks :links="links" :ui="{ icon: { active: 'bg-gray dark:bg-gray ring-2', inactive: 'group-hover:bg-gray' } }" />
          <UDivider type="dashed" class="mb-6" />

          <UNavigationTree :links="navigationLinks" default-open :multiple="false" class="pb-10" />
        </UAside>
      </template>

      <slot />
    </UPage>
  </UContainer>
</template>
