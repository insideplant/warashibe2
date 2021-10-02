/*global $*/
/*global location*/
/*global Cropper*/

$(function () {
  const profile_input = document.getElementById('profile_input');
  const modal4 = document.getElementById('modal4');
  const mask = document.querySelector('.mask');
  const cropper_area = document.getElementById('cropper-area');

  let fileName;

  profile_input.addEventListener('change', function(e){
    console.log('aaa');
    modal4.classList.remove('hidden');
    mask.classList.remove('hidden');
    let file = e.target.files[0];
    fileName = file.name;

    let reader = new FileReader();

    if(file.type.indexOf('image')<0){
      return false;
    }

    reader.onload = (function(file){
      return function(event){
        console.log(cropper_area);
        cropper_area.innerHTML = "";
        let image = document.createElement('img');
        console.log(image);
        image.src = event.target.result;
        image.id = "crop_image";
        image.title = file.name;
        image.height = '400';
        cropper_area.appendChild(image);
        initCrop();
      };
    })(file);
    reader.readAsDataURL(file);
  });

    let cropper;
    function initCrop() {
      cropper = new Cropper(crop_image,{
        dragmode: 'move',
        aspectRatio: 1/1,
        restore: false,
        guides: false,
        center: false,
        highlight: true,
        cropBoxMovable: true,
        cropBoxResizable: true,
        modal: false,
        ready: function(){
          croppable = true;
        }
      });
        // 初回表示時
      crop_image.addEventListener('ready', function(e){
        cropping(e);
      });
      // 画像をドラッグした際の処理
      crop_image.addEventListener('cropend', function(e){
        cropping(e);
      });
      // 画像を拡大・縮小した際の処理
      crop_image.addEventListener('zoom', function(e){
        cropping(e);
      });
    }

    let croppedCanvas;

    btn.addEventListener('click', function(){
      modal3.classList.add('hidden');
      mask.classList.add('hidden');
    });

  $('#submit').on('click',function(event){
    event.preventDefault();
    croppedCanvas.toBlob(function(blob) {
      let blob_file = new File([blob], fileName,{type: "image/png"});
      let formData = new FormData();
      let item_name = document.getElementById('item_itemname').value;
      let item_info = document.getElementById('item_info').value;
      formData.append('itemimage', blob_file);
      formData.append('itemname', item_name);
      formData.append('info', item_info);

      $.ajax({
        url: '/items',
        type: 'post',
        catch: false,
        dataType: 'json',
        processData: false,
        data: formData,
        contentType: false
      })
      .done(function(response){
        location.reload();
        console.debug("result" + response);
      })
      .fail(function(xhr){
        alert('失敗しました');
        console.debug("result" + xhr);
      });
    });
  });
})