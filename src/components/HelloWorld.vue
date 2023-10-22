<script setup lang="ts">
defineProps<{
  msg: string
}>()
import { ref } from 'vue'
const number = ref(0)
</script>

<template>
  <div class="greetings">
    <h1 class="relative font-medium leading-normal -top-[10px] text-[2.6rem] green">{{ msg }} with number {{ number }}</h1>
    <input
      inputmode="numeric"
      pattern="[0-9]*"
      type="text"
      class="p-1 mr-3 w-20 w-full text-black"
      v-model="number"
    />
    <h3 class="text-[1.2rem]">
      You’ve successfully created a project with
      <a href="https://vitejs.dev/" target="_blank" rel="noopener">Vite</a> +
      <a href="https://vuejs.org/" target="_blank" rel="noopener">Vue 3</a>. What's next?
    </h3>
  </div>
</template>

<style scoped>
.greetings h1,
.greetings h3 {
  text-align: center;
}

@media (min-width: 1024px) {
  .greetings h1,
  .greetings h3 {
    text-align: left;
  }
}
</style>
