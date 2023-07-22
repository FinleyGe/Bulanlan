<script setup lang="ts">
import { onMounted, ref } from 'vue';
import { GetRecommendBooks } from '../api/api'
import { Book } from '../type/type';
import { NCard, NTag, NSpace } from 'naive-ui';
const Books = ref<Book[]>([]);
function flush() {
  GetRecommendBooks().then((res) => {
    Books.value = res.data.data;
  })
}
onMounted(() => {
  flush()
})
</script>
<template>
  <div class="book" v-for="book in Books">
    <n-card>
      <div class="book-title">{{ book.name }}</div>
      <div class="book-author">{{ book.author }}</div>
      <div class="book-tags">
        <n-space>
          <n-tag v-for="tag in book.tags" type="info">{{ tag.name }}</n-tag>
        </n-space>
      </div>
    </n-card>
  </div>
</template>

<style scoped lang="scss">
.book {
  margin-bottom: 1rem;

  .book-title {
    font-size: 1.5rem;
    font-weight: bold;
  }

  .book-author {
    font-size: 1.2rem;
    color: #999;
  }

  .book-tags {
    margin-top: 1rem;
  }

}
</style>
