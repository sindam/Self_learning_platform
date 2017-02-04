<%@ include file="mainhead.jsp" %>
<div style="position:absolute; top:200px; left:600px">
<font style="font-family:times; font-size:14pt;">
<!DOCTYPE html>
<html>
<body>
<script>
function myFunction() {
    window.open("register.jsp","_self");
}
function myFunction1() {
    window.open("reginst.jsp","_self");
}
</script>
<script>
function validation()
{
var a=document.s.iname.value;
if(a=="")
{
alert("Enter Student Name");
document.s.iname.focus();
return false;
}
var c=document.s.email.value;
if(c=="")
{
alert("Enter Student Email");
document.s.email.focus();
return false;
}
var d=document.s.dob.value;
if(d=="")
{
alert("Enter Student Date Of Birth");
document.s.dob.focus();
return false;
}
var e=document.s.uname.value;
if(e=="")
{
alert("Enter Student Full Name");
document.s.uname.focus();
return false;
}
var f=document.s.pass.value;
if(f=="")
{
alert("Enter Student Password");
document.s.pass.focus();
return false;
}
var g=document.s.pass2.value;
if(g=="")
{
alert("Enter Student Conform Passwprd");
document.s.pass2.focus();
return false;
}

var i=document.s.pass.value;
var j=document.s.pass2.value;
if(i!=j)
{
alert("Password And Conform Password Are Not Same");
document.s.pass.focus();
return false;
}
}
</script>
 <input type="checkbox"  onclick="myFunction()">Student 
 <input type="checkbox" checked = "checked" onclick="myFunction1()">Instructor
 <form action="reginst1.jsp" onsubmit="return validation();" name="s">
<br><br>
Name <input type=text name="iname"><br><br>
Department<select name=dept>
<option>ECE</option>
<option>CSE</option>
<option>EEE</option>
<option>IT</option>
<option>Mech</option>
<option>Civil</option>
</select><br><br>
Email <input type=text name="email"><br><br>
DOB  <input type=date name="dob"><br><br>
User Name <input type=text name="uname"><br><br>
Password <input type=password name="pass"><br><br>
Conform Password <input type=password name="pass2"><br><br>
<input type=submit value="Register">
</form>
</body>
</html>
</div>