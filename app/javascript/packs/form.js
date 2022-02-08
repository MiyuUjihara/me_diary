$(document).on('turbolinks:load', ()=> {
  function buildHTML(fileUrl) {
    var html =
      `
      <div class="target">
        <img src="${fileUrl}" width="100%" height="100%" alt="イラスト1">
      </div>
      `
    return html;
  }

  $(".image-feild").on('click', () => {
    $(".image_area").click()
  })

  $(".image_area").on('change', (e) => {
    let file = e.target.files[0];

    let fileUrl = window.URL.createObjectURL(file);
    let content = buildHTML(fileUrl)

    $(".target").replaceWith(content);
  })  
});