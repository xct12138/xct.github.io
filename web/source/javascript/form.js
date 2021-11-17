var isCommitted = false;//表单是否已经提交标识，默认为false
function noRepeatSubmit(){
    if(isCommitted===false){
        isCommitted = true;//提交表单后，将表单是否已经提交标识设置为true
        return true;//返回true让表单正常提交
    }else{
        return false;//返回false那么表单将不提交
    }
}

function exit() {
    alert("确认退出？");
    document.cookie="user=;expires=Thu, 01 Jan 2020 00:00:00 GMT";
}