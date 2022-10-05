checkNull = function(obj, value, message){
	if(value == "" || value == null){
		alert(message);
		obj.focus();
		return false;
	}else{
		return true;
	}
}

checkName= function(obj, value, message) {
    var regExp =  /^[가-힣]$/ 
    if(regExp.test(value)) {
    	return true;
    } else {
		alert(message);
		obj.focus();
		return false;
	}
}

checkDob = function(obj, value, message) {
    var regExp = /^[0-9]{8}$/ ;
    if(regExp.test(value)) {
		return true;
	} else {
		alert(message);
        obj.focus();
		return false;
	}
}

checkOnlyNumber = function(obj, value, message) {
    var regExp = /^[0-9]+$/;
    if(regExp.test(value)) {
		return true;
	} else {
		alert(message);
        obj.focus();
		return false;
	}
}
checkNumber = function(obj, value, message) {
    var regExp = /^[0-9]{11}$/;
    if(regExp.test(value)) {
		return true;
	} else {
		alert(message);
        obj.focus();
		return false;
	}
}
checkbox_Check = function(obj, value, message){
	if ($("input:checkbox[name="+value+"]").is(":checked") == true) {
		return true;
	} else {
		alert(message);
		obj.focus();
		return false;
	}
}

checkId = function(obj, value, message) {
    var regExp = /^[A-Za-z0-9,_-]{5,20}$/;
    if(regExp.test(value)) {
		return true;
	} else {
		alert(message);
        obj.focus();
		return false;
	}
}




checkPassword = function(obj, value, message) {
	var regExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*]).{8,20}$/;
    /*var regExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$/;*/
    if(regExp.test(value)) {
		return true;
	} else {
		alert(message);
        obj.focus();
		return false;
	}
}

checkEmail = function(obj, value, message) {
    var regExp = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

/* */
    if(regExp.test(value)) {
    	return true;
    } else {
		alert(message);
		obj.focus();
		return false;
	}
}


checkOnlyEnglish = function(obj, value, message) {
    var regExp = /^[A-Za-z]+$/ 
    if(regExp.test(value)) {
		return true;
    }else {
		alert(message);
        obj.focus();
		return false;
	}
}




checkMobile = function(obj, value, message) {
    var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
    if(regExp.test(value)) {
    	return true;
    } else {
		alert(message);
		obj.focus();
		return false;
	}
}
/*
//javascript
function checkNull (obj, value, message){
	if(value == "" || value == null){
		alert("validation.js"+message);
		obj.focus();
		return false;
	}
}
*/
