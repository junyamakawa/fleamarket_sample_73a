$(document).on('turbolinks:load', function(){

  function build_childSelect() {
    let child_select = `
                        <select name="product[category_id]" class="child_category_id">
                          <option value="">---</option>
                        </select>
                        `
    return child_select;
  }

  function build_Option(children){
    let option_html = `
                        <option value=${children.id}>${children.name}</option>
                      `
    return option_html;
  }

  $('#category_form').on('change', function(){
    var parentCategory = $('#category_form').val();

    if(parentCategory !== "") {
      $.ajax ({
        url: '/products/get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(data){
        console.log('おめでとう！');
        let child_select = build_childSelect
        $("#category_form").append(child_select);

        data.forEach(function(d){
          let option_html = build_Option(d)
          $(".child_category_id").append(option_html);
        })
      })
      .fail(function(){
        alert('カテゴリーの取得に失敗しました')
      })
    } else [
      
    ]
  })
})
