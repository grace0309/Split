const refresh = function(content, displayed_box) {
  const content = document.querySelectorAll('.message_content');
  const displayed_box = document.getElementById('messages')
  const displayed_mes = displayed_box.querySelectorAll('.show')
  let i

  for (i = (displayed_mes.length-1); i < messages.length; i++) {
    const insert_content = content[i].dataset.content;
    displayed_box.insertAdjacentHTML('beforeend', insert_content);
}
}

const refreshtimer = () => {
  setInterval(refresh(content,displayed_box), 3000);
}

export { refreshtimer }
