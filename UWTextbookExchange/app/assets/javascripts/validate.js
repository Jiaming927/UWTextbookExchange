(function(){	
	window.onload = function() {
		document.getElementById("youremail").onblur = validemail;
		document.getElementById("reenteremail").onblur = reenteremail;
		document.querySelector('[name = "newuser[password]"]').onblur = validpassword;
		document.querySelector('[name = "newuser[reenterpassword]"]').onblur = reenterpassword;
	}

	function validemail(){
		var msg = document.getElementById("message");
		var email = document.getElementById("youremail").value.trim();
                var emailpatt = new RegExp("@uw.edu$");
		if (!emailpatt.test(email)){
				msg.innerHTML = 'Email should end with <strong>"uw.edu"</strong>';
				msg.hidden = false;
				$("#reenteremail").prop('disabled', true);
				$("#youremail").css("background-color", "#FF9999");
				$("#youremail").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
				$("#submit-button").attr('disabled', 'disabled');
                } else {
			msg.hidden = true;
			$("#reenteremail").prop('disabled', false);
                        $("#submit-button").removeAttr('disabled');
                        $("#youremail").css("background-color", "#FFFFFF");
		}
	}	

	function reenteremail(){
		var msg = document.getElementById("message");
               if ($("#youremail").val() !== $("#reenteremail").val()) {
			msg.innerHTML = "Email re-entered does not match";
			msg.hidden = false;
			$("#reenteremail").css("background-color", "#FF9999");
			$("#reenteremail").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
			$("#submit-button").attr('disabled', 'disabled');
               } else {
			msg.hidden = true;
                        $("#reenteremail").css("background-color", "#FFFFFF");
			$("#submit-button").removeAttr('disabled');
		}
	}




	function validpassword(){
		var msg = document.getElementById("message");
		var password = document.querySelector('[name = "newuser[password]"]').value;
		var hasUpper = new RegExp("[A-Z]");
		var hasLower = new RegExp("[a-z]");
		var hasNumber = new RegExp("[0-9]");
		if (password.length < 8 || password.length > 20 || !hasUpper.test(password) || !hasLower.test(password) || !hasNumber.test(password)){
			msg.innerHTML = 'Your password must be 8 to 20 characters with at least <br/> <strong>one digit</strong><br/> <strong>one lowercase letter</strong> <br/> <strong>one uppercase letter</strong>';
			msg.hidden = false;
			$("input[name='newuser[reenterpassword]']").prop('disabled', true);
                   $("input[name='newuser[password]']").css("background-color", "#FF9999");
                   $("input[name='newuser[password]']").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
                   $("#submit-button").attr('disabled', 'disabled');
		} else {
			msg.hidden = true;
			$("input[name='newuser[reenterpassword]']").prop('disabled', false);
			$("#submit-button").removeAttr('disabled');
			$("input[name='newuser[password]']").css("background-color", "#FFFFFF");
		}
	}

        function reenterpassword(){
		var msg = document.getElementById("message")
               if ($("input[name='newuser[password]']").val() !== $("input[name='newuser[reenterpassword]']").val()) {
				msg.innerHTML = "Password re-entered does not match";
				msg.hidden = false;
				$("input[name='newuser[reenterpassword]']").css("background-color", "#FF9999");
				$("input[name='newuser[reenterpassword]']").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
				$("#submit-button").attr('disabled', 'disabled');
               } else {
			msg.hidden = true;
			$("#submit-button").removeAttr('disabled');
			$("input[name='newuser[reenterpassword]']").css("background-color", "#FFFFFF");
                }
        }

})();
