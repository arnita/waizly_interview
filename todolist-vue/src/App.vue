<script setup>
import { onMounted,ref,computed,watch, reactive } from 'vue';
import { Button} from 'ant-design-vue';

const todos = ref([])
const name = ref('')

const input_content = ref('')

const todos_asc = computed(() => todos.value.sort((a,b) => b.createdAt - a.createdAt))

const addToDo = () => {
  if(input_content?.value.trim() === '') {
    return 
  }

  todos.value.push({
    content : input_content.value,
    createdAt : new Date().getTime(),
    done : false
  })
}

const removeToDo = todo => {
  todos.value = todos.value.filter(t => t !== todo)
}
watch(name, (newValue) => {
  localStorage.setItem('name',newValue)
})

watch(todos, (newValue) => {
  localStorage.setItem('todos',JSON.stringify(newValue))
},{ deep : true})

onMounted(() => {
    name.value = localStorage.getItem('name') || ''
    todos.value = JSON.parse(localStorage.getItem('todos')) || []
})


</script>

<template>
  <main class="app">
    <section class="greeting">
      <h2 class="title">
        What's Up, <input type="text" placeholder="Name Here" v-model="name"/>
      </h2>
    </section>

    <section class="create-todo">
        <h3>CREATE YOUR TO DO AND ENJOY YOUR DAY 😊</h3>
        <form @submit.prevent="addToDo">
          <input type="text" placeholder="e.g. make a video" class="" v-model="input_content"/>
          <input type="submit" value="add todo" />
        </form>
    </section>

    <section class="todo-list">
      <div class="list">
        <div v-for="todo in todos_asc" :class="`todo-item ${todo.done && 'done'}`">
          <label>
						<input type="checkbox" v-model="todo.done" />
						<span :class="`bubble ${
							todo.category == 'business' 
								? 'business' 
								: 'personal'
						}`"></span>
					</label>
          <div class="todo-content">
            <input type="text" class="" v-model="todo.content">
          </div>
          <div>
            <Button type="primary" size="small" danger  @click="removeToDo(todo)">DELETE</Button>
          </div>
        </div>
      </div>
      <div>
  </div>
    </section>
</main>
</template>

