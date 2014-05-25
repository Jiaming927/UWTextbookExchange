window.onload = function() {	
	getElementById("sign-form").onsubmit=function validateEmail () {
		var firstEmail=getElementById("youremail").value;
		var secondEmail=getElementById("reenteremail").value;
		if (firstEmail !== secondEmail) {
			alert("the email addresses do not match");
			return false;
		}
	}
}
