$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[images_attributes][${index}][src]"
                    id="product_images_attributes_${index}_src"><br>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<div class= "images"><img data-index="${index}" src="${url}" width="118px" height="118px"><br>
    <div class="js-remove">削除</div></div>`;
    return html;
  }
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
    if ($("img").length >= 7) {
      $('.box__photobox').css({'height':'450px'});
      $('.box__photobox__photoupload__container').css({'height':'300px'});
      $('#previews').css({'height':'300px'});
    };
  });
  $('#previews').on('click', function(e) { 
    const box = $(".js-file:last");
    box.trigger("click");
  });

  $('#previews').on('click', '.js-remove', function(e) {
    e.stopPropagation();
    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);

    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    if ($("img").length <= 6) {
      $('.box__photobox').css({'height':'300px'});
      $('.box__photobox__photoupload__container').css({'height':'150px'});
      $('#previews').css({'height':'150px'});
    }
  });
}); 