<script setup lang="ts">
import { NButton, NSpace, NTag, useMessage } from 'naive-ui';
import { onMounted, ref } from 'vue';
import { GetTags } from '../api/api';
const message = useMessage();
const tags = ref<string[]>([]);
function handleFlush() {
  GetTags().then(res => {
    tags.value = res.data.data.map((item: any) => item.name);
    message.success('刷新成功');
  }).catch(err => {
    message.error('刷新失败, ' + err);
  });
}

onMounted(() => {
  handleFlush();
});

</script>
<template>
  <n-space>
    <n-button type="primary" @click="handleFlush">刷新</n-button>
  </n-space>
  <n-space>
    <n-tag v-for="tag in tags">{{ tag }}</n-tag>
  </n-space>
</template>

<style scoped lang="scss"></style>
