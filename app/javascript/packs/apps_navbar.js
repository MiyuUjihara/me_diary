$(document).on('turbolinks:load', ()=> {
  
  const URL = location.href

  const TargetUrl = {
    apps_root: "/apps",
    apps_mypage: "/apps/users",
    diary: "/apps/diaries",
    todo: "/apps/todo"
  }

  if (URL.includes(TargetUrl.apps_mypage)) {
    $('.apps_choice').addClass("apps-select")
  } else if (URL.includes(TargetUrl.diary)) {
    $('.apps_choice').addClass("apps-select")
  }  else if (URL.includes(TargetUrl.todo)) {
    $('.apps_choice').addClass("apps-select")
  } else if (URL.includes(TargetUrl.apps_root)) {
    $('.apps_choice2').addClass("apps-select")
  }
});