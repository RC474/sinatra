let todoList = document.getElementById('todo-list');
let form = document.getElementById('add');
let edit = document.getElementById('edit'); //edit pop up div
let cancel = document.getElementById('cancel'); //cancel button inside edit form
let editForm = edit.querySelector('form');

// form.addEventListener('submit', (e) => { 
//   e.preventDefault();
//   let li = document.createElement('li');
//   // li.textContent = form.todo.value;
//   li.innerHTML = `<div><span>${form.todo.value}</span><span><i class="material-icons">edit</i><i class="material-icons">delete</i></span></div>`;
//   todoList.appendChild(li);
//   form.todo.value = "";
// });

todoList.addEventListener('click', (e) => {
  let li = e.target.closest('li');
  
  if(e.target.tagName == "I"){
    if(e.target.textContent == "edit"){
      edit.style.display = "flex";
      let todoSpan = li.querySelector('span');
      editForm.todo.value = todoSpan.textContent;
      editForm.todoid.value=li.dataset.todoId;
      
    }else{
      // let li = e.target.closest('li');
      fetch(`/todos/delete/${li.dataset.todoId}`);
      todoList.removeChild(li);
    }
  }else{
    let todo_span = e.target.closest('span');
    if(todo_span){
      todo_span.classList.toggle('strike-text');
    }
    
  }
  
});

// editForm.addEventListener('submit', (e) => {
//   e.preventDefault();
//   edit.style.display = "none";
// });

cancel.addEventListener('click', (e) => {
  edit.style.display = "none";
});