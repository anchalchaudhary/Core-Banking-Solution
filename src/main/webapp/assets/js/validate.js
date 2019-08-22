function validatelogin(){
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var valid = true;
	if(username==null || username==""){
		valid = false;
		document.getElementById("errusername").style.display = 'block';
	} 
	if(password==null || password==""){
		valid = false;
		document.getElementById("errpassword").style.display = 'block';	
	}
	return valid;
}
function validatecreateaccount(){
	var balance = document.getElementById("balance").value;
	var branch = document.getElementById("branch").value;
	var valid = true;
	if(balance==null || balance==""){
		valid = false;
		document.getElementById("errbalance").style.display = 'block';
	} 
	if(branch==null || branch==""){
		valid = false;
		document.getElementById("errbranch").style.display = 'block';	
	}
	return valid;
}