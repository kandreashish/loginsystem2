function validation() {
	var valid1 = document.getElementsByTagName("input");
	var valid = valid1[1];
	if(valid.value == "" || valid1[0].value == "" )
	{
		alert("UserName or password should not be empty");
		valid1[0].focus();
		valid1[0].style.borderBottom= "red dashed 1px";
		valid1[1].style.borderBottom= "red dashed 1px";                        
		return false;
	}
	else
	{
		return true;
	}

}

function ale(){
	var sim = document.getElementById("demo");
	if(sim.value == "first")
		alert("Login first");
	if(sim.value=="success")
		alert("signup success");
}
function message(){
	var sim = document.getElementById("demo");
	if(sim.value == "imagefile")
		alert("please choose a jpg or png file");
	if(sim.value == "success")
		alert("photo uploaded successfully");
	if(sim.value == "afile")
		alert("please choose a file");
}

