var d = document;

function JsonRequest(url,objdata,callback) {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', url);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = callback;
    xhr.send(JSON.stringify(objdata));
}

function UploadFileAjax(url,objdata,callback){
    var xhr = new XMLHttpRequest();
    xhr.open('POST', url, true);
    xhr.onload = callback;
    xhr.send(objdata);
}

function ShowLang(e){
    var e=d.querySelector('.dropdown-menu');
    var ClassName=e.className;
    e.className=ClassName+' show';
}

function ReloadLang(e) {
    e.preventDefault();
    var h=window.location.hostname;
    var p=window.location.pathname;
    var prot=window.location.protocol;
    p=p.split('/').slice(1);
    p[0]=e.target.rel;
    var el=d.querySelector('.dropdown-menu');
    el.className='dropdown-menu';
    d.getElementById('btnlang').textContent=e.target.textContent;
    console.log(prot+'//'+h+'/'+p.join('/'));
    window.location=prot+'//'+h+'/'+p.join('/');
}