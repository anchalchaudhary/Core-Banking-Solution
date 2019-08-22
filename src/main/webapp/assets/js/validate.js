function validatelogin(){
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var valid = true;
	if(username==null || username==""){
		valid = false;
		document.getElementById("errusername").style.display = 'inline';
	} 
	if(password==null || password==""){
		valid = false;
		document.getElementById("errpassword").style.display = 'inline';	
	}
	return valid;
}
function validatecreateaccount(){
	var balance = document.getElementById("balance").value;
	var branch = document.getElementById("branch").value;
	var valid = true;
	if(balance==null || balance==""){
		valid = false;
		document.getElementById("errbalance").style.display = 'inline';
	} 
	if(branch==null || branch==""){
		valid = false;
		document.getElementById("errbranch").style.display = 'inline';	
	}
	return valid;
}
function validatebranch(){
	var name = document.getElementById("name").value;
	var address = document.getElementById("address").value;
	var ifsc = document.getElementById("ifsc").value;
	var valid = true;
	if(name==null || name==""){
		valid = false;
		document.getElementById("errname").style.display = 'inline';
	} 
	if(address==null || address==""){
		valid = false;
		document.getElementById("erraddress").style.display = 'inline';	
	}
	if(ifsc==null || ifsc==""){
		valid = false;
		document.getElementById("errifsc").style.display = 'inline';	
	}
	if(valid==false)
		document.getElementById("footerdiv").style.minHeight = '26.6vh';	
	return valid;
}
function validatecustomer(){
	var name = document.getElementById("name").value;
	var address = document.getElementById("address").value;
	var phone = document.getElementById("phone").value;
	var email = document.getElementById("email").value;
	var salary = document.getElementById("salary").value;
	var valid = true;
	var emailvalid = true;
	var phonevalid = true;
	if(name==null || name==""){
		valid = false;
		document.getElementById("errname").style.display = 'inline';
	} 
	if(address==null || address==""){
		valid = false;
		document.getElementById("erraddress").style.display = 'inline';	
	}
	if(phone==null || phone==""){
		valid = false;
		phonevalid = validatephone();
		document.getElementById("errphone").textContent = "Enter Phone number";
		document.getElementById("errphone").style.display = 'inline';	
	}
	if(email==null || email==""){
		valid = false;
		emailvalid = validateemail();
		document.getElementById("erremail").textContent = "Enter Email"
		document.getElementById("erremail").style.display = 'inline';	
	}
	if(salary==null || salary==""){
		valid = false;
		document.getElementById("errsalary").style.display = 'inline';	
	}	
	return valid && emailvalid && phonevalid;
}
function validatephone(){
	var phone = document.getElementById("phone").value;
	var phoneformat = /^\d{10}$/;
	if(!phone.match(phoneformat)){
		document.getElementById("errphone").textContent = "Enter a valid phone number"
		document.getElementById("errphone").style.display = 'inline';
		return false;
	} else {
		document.getElementById("errphone").style.display = 'none';
		return true;
	}
}
function validateemail(){
	var email = document.getElementById("email").value;
	var mailformat = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
	if(!email.match(mailformat)){
		document.getElementById("erremail").textContent = "Enter a valid email address"
		document.getElementById("erremail").style.display = 'inline';
		return false;
	} else {
		document.getElementById("erremail").style.display = 'none';
		return true;
	}
}