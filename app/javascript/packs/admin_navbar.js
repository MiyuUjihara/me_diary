$(document).on('turbolinks:load', ()=> {
  
  const URL = location.href

  const TargetUrl = {
    columnindex: "/admin/columns",
    column: "/admin/columns/new",
    todo: "/admin/todos/new",
    todoindex: "/admin/todos",
    dashboard: "/admin"
  }

  if (URL.includes(TargetUrl.column)) {
    $('.admin_choice2').addClass("select")
  } else if (URL.includes(TargetUrl.columnindex)) {
    $('.admin_choice3').addClass("select")
  } else if (URL.includes(TargetUrl.todo)) {
    $('.admin_choice4').addClass("select")
  } else if (URL.includes(TargetUrl.todoindex)) {
    $('.admin_choice5').addClass("select")
  } else if (URL.includes(TargetUrl.dashboard)) {
    $('.admin_choice').addClass("select")
  }
});