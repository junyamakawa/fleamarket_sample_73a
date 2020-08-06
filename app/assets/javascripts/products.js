$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[images_attributes][${index}][src]"
                    id="product_images_attributes_${index}_src"><br>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class= "images"><img data-index="${index}" src="${url}" width="118px" height="118px"><br>
    <div class="js-remove">削除</div></div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  
  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    // console.log("aaa")
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
    // console.log($("img").length);
    // if (img = $(`img[data-index="${targetIndex}"]`)[6]) {
    // imgタグが７枚目になった時点で以下を実行しろ
    //   クラス名 .box__photoboxのcssのheightを450pxに変更しろ
    //   クラス名 .box__photobox__photoupload__containerのcssを高さ300pxに変更しろ
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
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
  

    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    // 削除するための機能？
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    // console.log($("img").length);
    if ($("img").length <= 6) {
      $('.box__photobox').css({'height':'300px'});
      $('.box__photobox__photoupload__container').css({'height':'150px'});
      $('#previews').css({'height':'150px'});
    }
  });
});