<script setup lang="ts">
import { NLayout, NLayoutSider, NMenu, MenuOption } from 'naive-ui';
import { usePageStore } from '../store';
import { h, onMounted, ref, watch } from 'vue';
import { Body, Book, Bookmark, Pencil } from '@vicons/ionicons5';
import router from '../router';
import { RouterView } from 'vue-router';
const pageStore = usePageStore();
const collapsed = ref<boolean>(true);
const menuOptions = <MenuOption[]>[
  {
    key: 'me',
    label: '我',
  },
  {
    key: 'book',
    label: '书籍推荐',
  },
  {
    key: 'test',
    label: '等级测试',
  },
  {
    key: 'tags',
    label: '兴趣标签',
  },
]
const activeKey = ref<string>('me')
function renderMenuIcon(option: MenuOption) {
  if (option.key == 'me') {
    return h(Body, { size: 22 })
  } else if (option.key == 'book') {
    return h(Book, { size: 22 })
  } else if (option.key == 'test') {
    return h(Pencil, { size: 22 })
  }
  return h(Bookmark, { size: 22 })
}

watch(
  activeKey,
  (val) => {
    collapsed.value = true;
    if (val == 'me') {
      router.push({ name: 'me' })
    } else if (val == 'book') {
      router.push({ name: 'book' })
    } else if (val == 'test') {
      router.push({ name: 'test' })
    } else if (val == 'tags') {
      router.push({ name: 'tags' })
    }
  },
  { immediate: true }
)
onMounted(() => {
  if (pageStore.pageSize == 'small') {
    collapsed.value = true
  } else {
    collapsed.value = false
  }
})
</script>
<template>
  <n-layout has-sider style="height:95vh">
    <n-layout-sider bordered collapse-mode="width" :collapsed-width="pageStore.pageSize == 'small' ? 12 : 64" :width="240"
      :collapsed="collapsed" show-trigger="bar" @collapse="collapsed = true" @expand="collapsed = false"
      :native-scrollbar="false">
      <n-menu :collapsed="collapsed" :collapsed-width="64" :collapsed-icon-size="22" :options="menuOptions"
        :render-icon="renderMenuIcon" :expand-icon="renderMenuIcon" v-model:value="activeKey" />
    </n-layout-sider>
    <n-layout :native-scrollbar="true">
      <router-view />
    </n-layout>
  </n-layout>
</template>

<style scoped lang="scss"></style>
