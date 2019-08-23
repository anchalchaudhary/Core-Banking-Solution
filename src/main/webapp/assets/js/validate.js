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
function validateemployee(){
	var name = document.getElementById("name").value;
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var valid = true;
	var passwordvalid = true;
	if(name==null || name==""){
		valid = false;
		document.getElementById("errname").style.display = 'inline';
	} 
	if(username==null || username==""){
		valid = false;
		document.getElementById("errusername").style.display = 'inline';	
	}
	if(password==null || password==""){
		valid = false;
		passwordvalid = validatepassword();
		document.getElementById("errpassword").textContent = "Enter password";
		document.getElementById("errpassword").style.display = 'inline';	
	}
	return valid && passwordvalid;
}
function validatepassword(){
	var password = document.getElementById("password").value;
	var passwordformat = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$])(?=.{5,})");
	if(!passwordformat.test(password)){
		document.getElementById("errpassword").textContent = "Enter a valid password";
		document.getElementById("errpassword").style.display = 'inline';	
	} else {
		document.getElementById("errpassword").style.display = 'none';
		return true;
	}	
}
function validateloan(){
	var customerid =document.getElementById("customerid").value;
	var amount = document.getElementById("amount").value;
	var tenure = document.getElementById("tenure").value;
	var loantype = document.getElementById("loantype").value;
	var rate = document.getElementById("rate").value;
	var valid = true;
	if(customerid==null || customerid==""){
		valid = false;
		document.getElementById("errcustomerid").style.display = 'inline';
	} 
	if(amount==null || amount==""){
		valid = false;
		document.getElementById("erramount").style.display = 'inline';	
	}
	if(tenure==null || tenure==""){
		valid = false;
		document.getElementById("errtenure").style.display = 'inline';
		document.getElementById("errtenure").style.textContent = "test";
	}
	if(loantype==null || loantype==""){
		valid = false;
		document.getElementById("errloantype").style.display = 'inline';	
	}
	if(rate==null || rate==""){
		valid = false;
		document.getElementById("errrate").style.display = 'inline';	
	}
	return valid;
}
function validatedepositwithdraw(){
	var sum = document.getElementById("sum").value;
	var valid = true;
	if(sum==null || sum==""){
		valid = false;
		document.getElementById("errsum").style.display = 'inline';
	}
	return valid;
}
function validatetransfer(){
	var toaccount = document.getElementById("toaccount").value;
	var amount = document.getElementById("amount").value;
	var valid = true;
	if(toaccount==null || toaccount==""){
		valid = false;
		document.getElementById("errtoaccount").style.display = 'inline';
	}
	if(amount==null || amount==""){
		valid = false;
		document.getElementById("erramount").style.display = 'inline';
	}
	return valid;
}