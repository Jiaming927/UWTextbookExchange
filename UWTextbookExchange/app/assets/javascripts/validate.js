(function(){	
	window.onload = function() {
		document.getElementById("youremail").onblur = validemail;
		document.querySelector("#user_password").onblur = validpassword;
		document.querySelector("#user_password_confirmation").onblur = reenterpassword;
	};


	function validemail(){
		var msg = document.getElementById("message");
		var email = document.getElementById("youremail").value.trim();
                var emailpatt = new RegExp("@uw.edu$");
		if (!emailpatt.test(email)){
				msg.innerHTML = 'Email should end with <strong>"uw.edu"</strong>';
				msg.hidden = false;
				$("#youremail").css("background-color", "#FF9999");
				$("#youremail").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
				$("#submit-button").attr('disabled', 'disabled');
                } else {
			msg.hidden = true;
                        $("#submit-button").removeAttr('disabled');
                        $("#youremail").css("background-color", "#FFFFFF");
		}
	}	

	function validpassword(){
		var msg = document.getElementById("message");
		var password = document.querySelector("#user_password").value;
		var hasUpper = new RegExp("[A-Z]");
		var hasLower = new RegExp("[a-z]");
		var hasNumber = new RegExp("[0-9]");
		if (password.length < 8 || password.length > 20 || !hasUpper.test(password) || !hasLower.test(password) || !hasNumber.test(password)){
			msg.innerHTML = 'Your password must be 8 to 20 characters with at least <br/> <strong>one digit</strong><br/> <strong>one lowercase letter</strong> <br/> <strong>one uppercase letter</strong>';
			msg.hidden = false;
			$("#user_password_confirmation").prop('disabled', true);
                   $("#user_password").css("background-color", "#FF9999");
                   $("#user_password").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
                   $("#submit-button").attr('disabled', 'disabled');
		} else {
			msg.hidden = true;
			$("#user_password_confirmation").prop('disabled', false);
			$("#submit-button").removeAttr('disabled');
			$("#user_password").css("background-color", "#FFFFFF");
			$("#user_password_confirmation").css("background-color", "#FFFFFF");
		}
	}

        function reenterpassword(){
		var msg = document.getElementById("message")
               if ($("#user_password").val() !== $("#user_password_confirmation").val()) {
				msg.innerHTML = "Password re-entered does not match";
				msg.hidden = false;
				$("#user_password_confirmation").css("background-color", "#FF9999");
				$("#user_password_confirmation").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
				$("#submit-button").attr('disabled', 'disabled');
               } else {
			msg.hidden = true;
			$("#submit-button").removeAttr('disabled');
			$("#user_password_confirmation").css("background-color", "#FFFFFF");
                }
        }

})();
