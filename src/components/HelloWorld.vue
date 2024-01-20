<script setup lang="ts">
defineProps<{
  msg: string
}>()
import { ref } from 'vue'
import { Button } from '@/components/ui/button'
const number = ref(0)
</script>

<template>
  <div class="greetings">
    <h1
      class="relative font-medium leading-normal text-center lg:text-left -top-[10px] text-[2.6rem] green"
    >
      {{ msg }} with number {{ number }}
    </h1>
    <input
      inputmode="numeric"
      pattern="[0-9]*"
      type="text"
      class="p-1 mr-3 w-20 w-full text-black"
      v-model="number"
    />
    <Button>Click me</Button>
    <h3 class="text-center lg:text-left text-[1.2rem]">
      You’ve successfully created a project with
      <a href="https://vitejs.dev/" target="_blank" rel="noopener">Vite</a> +
      <a href="https://vuejs.org/" target="_blank" rel="noopener">Vue 3</a>. What's next?
    </h3>
  </div>
</template>

<style scoped></style>
