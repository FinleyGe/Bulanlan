<script setup lang="ts">
import { NCard, NInput } from 'naive-ui';
import './styles/problem.scss'
const answer = defineModel<string>();
</script>
<template>
  <div class="base">
    <n-card title="输入">
    <div class="content">
      <slot />
    </div>
    <n-input placeholder="分数" v-model:value="answer">
    </n-input>
    </n-card>
  </div>
</template>

<style scoped lang="scss"></style>
