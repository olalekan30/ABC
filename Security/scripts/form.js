
function gotoURL(dropDown) {
URL=dropDown.options[dropDown.selectedIndex].value
if(URL.length>0) 
parent.location.href=URL;}


function validate(which){
var subject = document.form.subject.value;

var emailCheck = document.form.email.value.indexOf("@");
var realName = document.form.realname.value;
var telNum = document.form.your_telephone_number.value;	
var messageCheck = document.form.your_message.value;



	if (subject == "none"){
		alert("You must select a category");
		document.form.subject.focus()
		return false
	}
	
	if (realName == ""){
		alert("please enter your name");
		document.form.realname.focus()
		return false
	}

	if (telNum == "" ){
		alert("please enter your telephone number");
		document.form.your_telephone_number.focus()
		return false
	}
	
		
	if (emailCheck== -1){
		alert("please enter a valid email address");
		document.form.email.focus()
		//.focus();
		return false
	}
	
	
	if (messageCheck == "" ){
		alert("please enter your mesage to us");
		document.form.your_message.focus()
		return false
	}

	
}
