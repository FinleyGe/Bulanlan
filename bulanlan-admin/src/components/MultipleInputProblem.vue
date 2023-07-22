<script setup lang="ts">
import { NCard, NInput } from 'naive-ui';
import './styles/problem.scss'
const props = defineProps<{
  problems: String[];
}>();
const answers = defineModel<string[]>();
</script>
<template>
  <div class="base">
    <n-card title="输入">
      <div class="content">
        <slot />
      </div>
      {{ props.problems[0] }}
      <n-input placeholder="请输入" v-model:value="answers![0]" />
      {{ props.problems[1] }}
      <n-input placeholder="请输入" v-model:value="answers![1]" />
      {{ props.problems[2] }}
      <n-input placeholder="请输入" v-model:value="answers![2]" />
      {{ props.problems[3] }}
      <n-input placeholder="请输入" v-model:value="answers![3]" />
    </n-card>
  </div>
</template>
