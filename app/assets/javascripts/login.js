'use-strict';

{
  const modalopen = document.querySelectorAll('.modalopen');
  const shut = document.querySelector('.shut');
  const modal = document.getElementById('modal');
  const modal2 = document.getElementById('modal2');
  const modal3 = document.getElementById('modal3');
  const mask = document.querySelector('.mask');

  modalopen.forEach((moda) => {
    moda.addEventListener('click',()=>{
    (modal || modal2).classList.remove('hidden');
    mask.classList.remove('hidden');
    });
  });

  shut.addEventListener('click',()=>{
    (modal || modal2).classList.add('hidden');
    mask.classList.add('hidden');
  });

  mask.addEventListener('click',()=>{
    (modal || modal3).classList.add('hidden');
    mask.classList.add('hidden');
  });
}