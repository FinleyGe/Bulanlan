<script setup lang="ts">
import { NCard, NStatistic, NGrid, NGi, NIcon, NMenu, NButton } from 'naive-ui';
import { Body, Book, Refresh } from '@vicons/ionicons5';
import { onMounted, ref } from 'vue';
import ManageBook from '../components/ManageBook.vue';
import { GetBookCount, GetUserCount } from '../api/api';
const activeKey = ref<string>('statistic');
const menuOptions = [
  {
    key: 'statistic',
    label: '统计',
  },
  {
    key: 'book',
    label: '书籍管理',
  }, {
    key: 'user',
    label: '用户管理'
  }
];

const userCount = ref<number>(0);
const bookCount = ref<number>(0);

async function flush() {
  var res = await GetBookCount();
  var res2 = await GetUserCount();
  userCount.value = res2.data.data.count;
  bookCount.value = res.data.data.count;
}
onMounted(() => {
  flush();
});

</script>
<template>
  <div class="page">
    <header>
      <n-menu v-model:value="activeKey" mode="horizontal" :options="menuOptions" />
    </header>
    <main>
      <n-card title="统计数据" v-if="activeKey == 'statistic'">
        <n-button type="primary" @click="flush">
          <template #icon>
            <n-icon>
              <Refresh />
            </n-icon>
          </template>
          刷新</n-button>
        <n-grid :cols="2">
          <n-gi>
            <n-statistic label="用户" :value="userCount">
              <template #prefix>
                <n-icon>

                  <Body />
                </n-icon>
              </template>
            </n-statistic>
          </n-gi>
          <n-gi>
            <n-statistic label="书籍" :value="bookCount">
              <template #prefix>
                <n-icon>
                  <Book />
                </n-icon>
              </template>
            </n-statistic>
          </n-gi>
        </n-grid>
      </n-card>

      <n-card title="书籍管理" v-if="activeKey == 'book'">
        <manage-book />
      </n-card>
    </main>
  </div>
</template>

<style scoped lang="scss">
.page {
  display: grid;
  grid-template-rows: auto 1fr;
  min-height: 100vh;

  header {
    background-color: #ddd;
  }

  main {
    padding: 20px;
    background-color: #eee;
  }
}
</style>
