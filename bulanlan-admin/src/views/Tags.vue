<script setup lang="ts">
import { NCard, useMessage, NSpace, NTag, NButton } from 'naive-ui';
import { onMounted, ref } from 'vue';
import { GetTags, UpdateUserTags } from '../api/api';
import { userStore } from '../store';
import router from '../router';
const tags = ref<string[]>([])
const selectedTags = ref<string[]>([])
const message = useMessage();
const store = userStore();
const check = ref<boolean[]>([])
function flushTags() {
  GetTags().then((res) => {
    if (res.status == 200) {
      tags.value = res.data.data.map((item: any) => item.name);
    } else {
      message.error('获取标签失败');
    }
  })
  check.value = tags.value.map((item: any) => {
    return selectedTags.value.includes(item);
  }
  )
}
onMounted(() => {
  flushTags();
  selectedTags.value = store.userInfo.tags.map((item: any) => item.name);
})

function submit() {
  let upload_tags: string[] = [];
  for (let i = 0; i < check.value.length; i++) {
    if (check.value[i]) {
      upload_tags.push(tags.value[i]);
    }
  }
  UpdateUserTags(upload_tags).then((res) => {
    if (res.status == 200) {
      message.success('更新成功');
      router.push('/home/me');
    } else {
      message.error('更新失败');
    }
  })
}

</script>
<template>
  <div class="base">
    <n-card title="选择你的兴趣标签">
      <n-space>
        <n-button type="primary" round @click="flushTags">刷新</n-button>
        <n-button type="primary" round @click="submit">提交</n-button>
      </n-space>
      <n-space>
        <n-tag v-for="tag, index in tags" checkable v-model:checked="check[index]">{{ tag }}</n-tag>
      </n-space>
    </n-card>
  </div>
</template>

<style scoped lang="scss"></style>
