$(document).on('turbolinks:load', ()=> {
  
  const URL = location.href

  const TargetUrl = {
    dashbord: "/admin/columns",
    column: "/admin/columns/new",
    todo: "/admin/todos/new"
  }

  if (URL.includes(TargetUrl.column)) {
    $('.admin_choice2').addClass("select")
  } else if (URL.includes(TargetUrl.dashbord)) {
    $('.admin_choice').addClass("select")
  } else if (URL.includes(TargetUrl.todo)) {
    $('.admin_choice3').addClass("select")
  }

});