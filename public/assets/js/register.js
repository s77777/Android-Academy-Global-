document.addEventListener('DOMContentLoaded',function(){
    let button=d.forms[0].querySelector('[type=button]');
    button.addEventListener('click',function(){
        let f=d.forms[0];
        if (f.psw.value.toUpperCase()===f.psw2.value.toUpperCase()) {
            f.submit();
        } else {
           alert(arrMsg.psw);
           psw.focus();
        }
    });
    let email=d.getElementsByName('email')[0];
    email.addEventListener('blur',getEmailAjax);
});

function getEmailAjax(e) {
    let f=d.forms[0];
    let data={'email':f.email.value}
    JsonRequest('/'+locale +'/' + Class + '/getEmailAjax',data,function (e) {
        if (e.target.status === 200) {
            var result=JSON.parse(e.target.responseText);
            if (result.success==false) {
                alert(arrMsg.emailExist);
                f.email.focus();
            }
        } else if (e.target.status !== 200) {
            console.log(arrMsg.errorRequest + e.target.status);
        }
    });
}