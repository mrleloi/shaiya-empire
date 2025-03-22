function init() {
  container = document.createElement('div');
  container.setAttribute('class', 's1');
  document.body.appendChild(container);

  container = document.createElement('div');
  container.setAttribute('class', 's2');
  document.body.appendChild(container);

  container = document.createElement('div');
  container.setAttribute('class', 's3');
  document.body.appendChild(container);

  container = document.createElement('div');
  container.setAttribute('class', 's4');
  document.body.appendChild(container);

  container = document.createElement('div');
  container.setAttribute('class', 's5');
  document.body.appendChild(container);

  container = document.createElement('div');
  container.setAttribute('class', 's6');
  document.body.appendChild(container);

  container = document.createElement('div');
  container.setAttribute('class', 's7');
  document.body.appendChild(container);

  container = document.createElement('div');
  container.setAttribute('class', 's7a');
  document.body.appendChild(container);

  container = document.createElement('div');
  container.setAttribute('class', 's8');
  document.body.appendChild(container);

  var lights=document.createElement('div');
  lights.setAttribute('class','lights');
  lights.setAttribute('id','lights');
  var ul=document.createElement('ul');
  ul.setAttribute('class','lightrope');
  document.body.appendChild(lights);
  lights.appendChild(ul);
  for (var i=0; i<30; i++){
      var li=document.createElement('li');
      ul.appendChild(li);
  }
}