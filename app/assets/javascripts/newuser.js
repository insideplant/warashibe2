/*global $*/

$(function(){
  'use strict';

  let cards = document.getElementById('cards');
  let target_submit = document.getElementById('target_submit');
  let retry = document.getElementById('retry');

  target_submit.addEventListener('click', function(event){
    event.preventDefault();
    const target_item = document.getElementById('user_target');
    const err_msg = document.querySelector('.err_msg');
    if (!target_item.value) {
      err_msg.classList.add('form-invalid');
      err_msg.textContent = '入力されておりません';
      target_item.classList.add('input-invalid');
      return;
    }else{
      err_msg.textContent = '';
      target_item.classList.remove('input-invalid');
      const form = document.getElementById('target_form');
      const form_action = form.action;
      const target_value = target_item.value;
      console.log(target_value);
      let formData = new FormData();
      formData.append('target', target_value);
      
      const data = { 'target': target_value};
      $.ajax({
        url: form_action,
        type: 'put',
        catch: false,
        dataType: 'json',
        processData: false,
        data: formData,
        contentType: false,
      })
      .done(function(response){
        console.debug("result" + response);
      })
      .fail(function(xhr){
        alert('失敗しました');
        console.debug("result" + xhr);
      });
    }
    cards.className = 'move';
  });

  retry.addEventListener('click', function(){
    cards.className = '';
  });
});