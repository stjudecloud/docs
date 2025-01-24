<script setup lang="ts">
const { footer } = useAppConfig()
</script>

<template>
  <UFooter :links="footer?.links">
    <template #left>
      {{ footer.credits }}
    </template>

    <template #right>
      <UButton aria-label="St. Jude Cloud Docs on GitHub" icon="i-simple-icons-github" to="https://github.com/stjudecloud/docs" target="_blank" color="gray" variant="link" />
    </template>
  </UFooter>
</template>
