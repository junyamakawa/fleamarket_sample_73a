$(function(){
  function buildHTML(comment){
    if (comment.currentuser == comment.seller) {
    var html = `<div class="comments__comment">
    <div class="comments__comment__username">
    ${comment.user_name}
    <div class="seller_display">
    出品者
    </div>
    </div>
    <div class="comments__comment__commentbox">
    ${comment.comment}
    <div class="comment_create_at">
    ${comment.created_at}
    </div>
    </div>
    </div>`
  } else {
    var html = `<div class="comments__comment">
    <div class="comments__comment__username">
    ${comment.user_name}
    </div>
    <div class="comments__comment__commentbox">
    ${comment.comment}
    <div class="comment_create_at">
    ${comment.created_at}
    </div>
    </div>
    </div>`
  }
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      // console.log(data);
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})