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
    console.log('change');
    if(parentCategory !== "") {
      $.ajax ({
        url: '/products/get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(data){
        console.log('おめでとう！');
        console.log(data);
        $('.child_category_id').remove();
        $('.gc_category_id').remove();
        let child_select = build_childSelect()
        $('.child_category_id').remove();
        $(".childCategory").append(child_select);
        
        data.forEach(function(d){
          let option_html = build_Option(d)
          $(".child_category_id").append(option_html);
        })
      })
      .fail(function(){
        alert('カテゴリーの取得に失敗しました')
      })
    } else {
      $('.child_category_id').remove();
      $('.gc_category_id').remove();
    }
  })
})

$(document).on('change', '.child_category_id', function () {
  console.log('やったねー！');
  let childValue = $('.child_category_id').val();

  function build_gcSelect(){
    let gc_select = `
                  <select name="product[category_id]" class="gc_category_id">
                    <option value="">---</option>
                  </select>
                  `
    return gc_select;
  }

  function build_Option(children){
    let option_html = `
                        <option value=${children.id}>${children.name}</option>
                      `
    return option_html;
  }

  console.log(childValue);

  if(childValue !== "") {
    $.ajax ({
      url: '/products/get_category_grandchildren',
      type: 'GET',
      data: { child_id: childValue },
      dataType: 'json'
    })
    .done(function(gc_data){
      console.log(gc_data);
      let grand_child_select = build_gcSelect
      $('.gc_category_id').remove();
      $(".childCategory").append(grand_child_select);

      gc_data.forEach(function(gc_d){
        let option_html = build_Option(gc_d)
        $(".gc_category_id").append(option_html);
      });
    })
    .fail(function(){
      alert('孫カテゴリーの取得に失敗しました')
    });
  } 
})