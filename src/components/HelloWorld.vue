<script setup lang="ts">
defineProps<{
  msg: string
}>()
import { ref } from 'vue'
const number = ref(0)
</script>

<template>
  <div class="greetings">
    <h1 class="green">{{ msg }}with number {{number}}</h1>
    <input
        inputmode="numeric"
        pattern="[0-9]*"
        type="text"
        class="p-1 mr-3 w-20 text-black w-full"
        v-model="number"
        />
    <h3>
      You’ve successfully created a project with
      <a href="https://vitejs.dev/" target="_blank" rel="noopener">Vite</a> +
      <a href="https://vuejs.org/" target="_blank" rel="noopener">Vue 3</a>. What's next?
    </h3>
  </div>
</template>

<style scoped>
h1 {
  font-weight: 500;
  font-size: 2.6rem;
  position: relative;
  top: -10px;
}

h3 {
  font-size: 1.2rem;
}

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
