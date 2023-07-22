<script setup lang="ts">
import { ref } from 'vue';
import SingleSelect from '../components/SingleSelect.vue';
import InputProblem from '../components/InputProblem.vue';
import MultipleInputProblem from '../components/MultipleInputProblem.vue';
import { NButton, NSpace, useMessage } from 'naive-ui';
import { UpdateUserLevel } from '../api/api';
const message = useMessage();
const answer1 = ref<number>(0)
const answer2 = ref<string>('0')
const answer3 = ref<number>(0)
const answer4 = ref<string[]>(['0', '0', '0', '0'])
const options1 = ref<string[]>(['四级', '六级', '专四', '专八', '还未通过'])
const options2 = ref<string[]>(['从未读完过', '读完过一本', '两本及以上'])
const problems = [
  '我能理解文章中所有单词的意思(1-5)',
  '我能理解难句的意思，并用自己的话转述(1-5)',
  '我能理解作者的观点和态度(1-5)',
  '我能总结段落大意(1-5)',
]
const problemIndex = ref<number>(1);
const level = ref<string>('');

function updateLevel() {
  UpdateUserLevel(level.value).then((res) => {
    if (res.status == 200) {
      message.success('更新成功');
    } else {
      message.error('更新失败');
    }
  })
}
function nextProblem() {
  if (problemIndex.value == 1) {
    if (answer1.value == 4) {
      level.value = 'AB';
      problemIndex.value = 3;
    } else {
      problemIndex.value = 2;
    }
  } else if (problemIndex.value == 2) {
    var score = Number.parseInt(answer2.value)
      / (answer1.value == 0 || answer1.value == 1 ? 710 : 100);
    if (score < 0.6) {
      message.error('你还未通过此等级考试，请检查输入或返回上一题');
    } else {
      if (score >= 0.85) {
        if (answer1.value == 0) {
          level.value = 'B'
          updateLevel();
        } else if (answer1.value == 1) {
          level.value = 'C'
          updateLevel();
        } else if (answer1.value == 2) {
          level.value = 'DE'
          problemIndex.value = 5;
        } else if (answer1.value == 3) {
          level.value = 'F'
          updateLevel();
        }
      } else if (score >= 0.7) {
        if (answer1.value == 0) {
          level.value = 'AB'
          problemIndex.value = 3;
        } else if (answer1.value == 1) {
          level.value = 'BC'
          problemIndex.value = 3;
        } else if (answer1.value == 2) {
          level.value = 'D'
          updateLevel();
        } else if (answer1.value == 3) {
          level.value = 'EF'
          problemIndex.value = 5;
        }
      } else {
        if (answer1.value == 0) {
          level.value = 'A';
          updateLevel();
        } else if (answer1.value == 1) {
          level.value = 'AB';
          problemIndex.value = 3;
        } else if (answer1.value == 2) {
          level.value = 'CD';
          problemIndex.value = 4;
        } else if (answer1.value == 3) {
          level.value = 'DE';
          problemIndex.value = 5;
        }
      }
    }
  } else if (problemIndex.value == 3) {
    if (answer3.value == 0) {
      level.value = level.value[0];
    } else if (answer3.value == 2) {
      level.value = level.value[1];
    } else {
      level.value = 'B'
    }
    updateLevel();
  } else {
    let sum = answer4.value.map((x) => parseInt(x)).reduce((x, y) => x + y);
    if (sum <= 12) {
      level.value = level.value[0];
    } else {
      level.value = level.value[1];
    }
    updateLevel();
  }
}

function prevProblem() {
  if (answer1.value == 4 && problemIndex.value == 3) {
    problemIndex.value = 1
  } else {
    if (problemIndex.value > 2) {
      problemIndex.value = 2
    } else {
      problemIndex.value = 1
    }
  }
}
</script>
<template>
  <!-- {{ level }} -->
  <!-- {{ answer1 }} -->
  <!-- {{ answer2 }} -->
  <!-- {{ answer3 }} -->
  <!-- {{ answer4 }} -->
  <div v-if="problemIndex == 1" class="problem">
    <single-select :options="options1" v-model="answer1">你上一次通过的等级考试</single-select>
  </div>
  <div v-if="problemIndex == 2" class="problem">
    <input-problem v-model="answer2">你上一次通过等级考试的分数</input-problem>
  </div>
  <div v-if="problemIndex == 3" class="problem">
    <single-select :options="options2" v-model="answer3">您曾读完过多少英语原版书</single-select>
  </div>
  <div v-if="problemIndex == 4" class="problem">
    <multiple-input-problem v-model="answer4" :problems="problems">
      阅读下列语段，自我评分<br />
      Alive, Miss Emily had been a tradition, a duty, and a care; a sort of hereditary obligation upon the town, dating
      from that day in 1894 when Colonel Sartoris, the mayor--he who fathered the edict that no Negro woman should appear
      on the streets without an apron-remitted her taxes, the dispensation dating from the death of her father on into
      perpetuity. Not that Miss Emily would have accepted charity. Colonel Sartoris invented an involved tale to the
      effect that Miss Emily's father had loaned money to the town, which the town, as a matter of business, preferred
      this way of repaying. Only a man of Colonel Sartoris' generation and thought could have invented it, and only a
      woman could have believed it.
    </multiple-input-problem>
  </div>
  <div v-if="problemIndex == 5" class="problem">
    <multiple-input-problem v-model="answer4" :problems="problems">
      阅读下列语段，自我评分<br />
      Simple-minded people tend to equate the symbol with what it stands for, to attribute to things and events some of
      the qualities expressed by the words in terms of which the propagandist has chosen, for his own purposes, to talk
      about them. Consider a simple example. Most cosmetics are made of lanolin, which is a mixture of purified wool fat
      and water beaten up into an emulsion. This emulsion has many valuable properties: it penetrates the skin, it does
      not become rancid, it is mildly antiseptic and so forth. But the commercial propagandists do not speak about the
      genuine virtues of the emulsion. They give it some picturesquely voluptuous name, talk ecstatically and misleadingly
      about feminine beauty and show pictures of gorgeous blondes nourishing their tissues with skin food. "The cosmetic
      manufacturers," one of their number has written, "are not selling lanolin, they are selling hope." For this hope,
      this fraudulent implication of a promise that they will be transfigured, women will pay ten or twenty times the
      value of the emulsion which the propagandists have so skillfully related, by means of misleading symbols, to a
      deep-seated and almost universal feminine wish—the wish to be more attractive to members of the opposite sex.
    </multiple-input-problem>
  </div>
  <div class="problem">
    <n-space>
      <n-button @click="prevProblem()" :disabled="problemIndex == 1">上一题</n-button>
      <n-button @click="nextProblem()">{{ problemIndex < 3 ? '下一题' : '提交' }}</n-button>
    </n-space>
  </div>
</template>

<style scoped lang="scss">
.problem {
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
