<script setup lang="ts">
import { NDataTable, NButton, NSpace, NTag, useMessage } from 'naive-ui';
import type { DataTableColumns } from 'naive-ui';
import type { Book } from '../type/type';
import { h, onMounted, ref } from 'vue';
import { GetBooks, UploadBookList } from '../api/api';
const message = useMessage();
const bookColums = <DataTableColumns<Book>>[{
  key: "name",
  title: "书名",
}, {
  key: "author",
  title: "作者",
}, {
  key: "level",
  title: "等级",
}, {
  key: "tags",
  title: "标签",
  render(row) {
    if (row.tags == null) {
      return h(NTag, { type: 'warning' }, { default: () => '无' });
    }
    return h(NSpace, null, {
      default: () =>
        row.tags.map((tag) => {
          return h(NTag, { type: 'info' }, { default: () => tag.name });
        }),
    });
  },
},
];

const BookData = ref<Book[]>([]);
async function handleFlush() {
  const res = await GetBooks();
  BookData.value = res.data.data;
}

function handleAdd() {
  let booklist: File;
  const input = document.createElement('input');
  input.type = 'file';
  input.onchange = (e) => {
    booklist = (<HTMLInputElement>e.target).files![0];
  };
  input.click();
  input.onchange = async (_) => {
    const res = await UploadBookList(booklist);
    if (res.status == 200) {
      message.success('上传成功');
      handleFlush();
    }
  };
}

onMounted(() => {
  handleFlush();
});
</script>
<template>
  <n-space>
    <n-button type="primary" @click="handleFlush">刷新</n-button>
    <n-button type="primary" @click="handleAdd">添加</n-button>
  </n-space>
  <n-data-table :columns="bookColums" :data="BookData">
  </n-data-table>
</template>

<style scoped lang="scss"></style>
