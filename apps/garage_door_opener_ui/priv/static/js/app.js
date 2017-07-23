document.getElementsByTagName('button')[0].addEventListener('click', function(event) {
  const request = new XMLHttpRequest();
  request.open('GET', '/api/garage_door/press');
  request.send();
})
