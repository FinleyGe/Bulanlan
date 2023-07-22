<script setup lang="ts">
import { NSpace, NButton, NCard } from 'naive-ui';
import './styles/problem.scss';
const props = defineProps<{
  options: String[];
}>();

// defineEmits(['update:answer']);

const answer = defineModel<number>();
function handleSelect(index: number) {
  answer.value = index;
}
</script>
<template>
  <div class="base">
    <n-card title="单选题" class="card">
      <div class="content">
        <slot />
      </div>
      <n-space>
        <n-button v-for="option, index in props.options" @click="handleSelect(index)"
          :type="index != answer ? 'default' : 'success'">
          {{ option }}
        </n-button>
      </n-space>
    </n-card>
  </div>
</template>

<style scoped lang="scss"></style>
