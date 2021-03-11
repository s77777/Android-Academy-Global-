var validate={
    file:function(file) {
        var fExt = file.substring(file.lastIndexOf(".")+1)
        if(fExt === "gif" || fExt === "jpg" || fExt === "png"){
            return true;
	}
        return false;
    }
}

d.addEventListener('DOMContentLoaded',function(){
    d.querySelector('input[type="file"]').addEventListener('change',function(){
        var form = d.forms[1];
        var file = form.file.files[0];
        form.querySelector('.custom-file-label').textContent=file.name;
    });
    d.querySelector('button[name=Upload]').addEventListener('click',Action);
});

function Action(e) {
    var form=d.forms[1];
    var input = form.file;
    var file = input.files[0];
    if (validate.file(file.name)===false) {
        alert(arrMsg.fExtError);
        return false;
    }
    var data = new FormData();
    data.append("file", file);
    data.append('id',form.id.value);
    UploadFileAjax('/FileUpload',data,function(e){
        e.preventDefault();
        if (e.target.status === 200) {
            var result=JSON.parse(e.target.responseText);
            if (result.success) {
                var img=d.getElementById('userfoto');
                    img.src='/download/'+result.filename;
                    d.forms[0].foto.value=result.filename;
            }
            else {
                console.log(arrMsg.errorScript);
            }
        } else if (e.target.status !== 200) {
            console.log(arrMsg.errorRequest + e.target.status);
        }
    })
}

function is_null_elem(elem) {
    if (null==elem)
        return true;
    else
        return false;
}
