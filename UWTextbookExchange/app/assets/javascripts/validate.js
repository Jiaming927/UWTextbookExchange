(function(){
	window.onload = function() {
		document.getElementById("reenteremail").onblur = testemail;	
		document.querySelector('[name = "reenterpassword"]').onblur = testpassword;
	}

	function testemail(){

               if ($("#youremail").val() !== $("#reenteremail").val()) {
			$("#youremail").css("background-color", "#FF9999");
			$("#reenteremail").css("background-color", "#FF9999");
			$("#youremail").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
			$("#reenteremail").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
			$("#submit-button").attr('disabled', 'disabled');
               } else {
			$("#youremail").css("background-color", "#FFFFFF");
                        $("#reenteremail").css("background-color", "#FFFFFF");
			$("#submit-button").removeAttr('disabled');
		}
	}

        function testpassword(){
               if ($("input[name='password']").val() !== $("input[name='reenterpassword']").val()) {
                        $("input[name='password']").css("background-color", "#FF9999");
                        $("input[name='reenterpassword']").css("background-color", "#FF9999");
                        $("input[name='password']").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
                        $("input[name='reenterpassword']").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
			$("#submit-button").attr('disabled', 'disabled');
               } else {
			$("#submit-button").removeAttr('disabled');
                        $("input[name='password']").css("background-color", "#FFFFFF");
                        $("input[name='reenterpassword']").css("background-color", "#FFFFFF");
                }
        }
})();