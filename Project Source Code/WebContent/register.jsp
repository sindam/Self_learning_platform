<%@ include file="mainhead.jsp" %>
<div style="position:absolute; top:200px; left:600px">
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
var a=document.s.sname.value;
if(a=="")
{
alert("Enter Student Name");
document.s.sname.focus();
return false;
}
var b=document.s.sid.value;
if(b=="")
{
alert("Enter Student ID");
document.s.sid.focus();
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
var h=document.s.pic.value;
if(h=="")
{
alert("Select Profile Picture");
document.s.pic.focus();
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
 <input type="checkbox" checked = "checked" onclick="myFunction()">Student 
 <input type="checkbox"  onclick="myFunction1()">Instructor
 
<br><br>
<form name="s" action="register1.jsp" onsubmit="return validation();" enctype="multipart/form-data" method=post>
Name<input type=text name="sname"><br><br>
ID<input type=text name="sid"><br><br>
Department<select name=dept><br><br>
<option>ECE</option>
<option>CSE</option>
<option>EEE</option>
<option>IT</option>
<option>Mech</option>
<option>Civil</option>
</select><br><br>
Email <input type=text name="email"><br><br>
DOB  <input type=date name="dob"><br><br>
Full Name <input type=text name="uname"><br><br>
Password <input type=password name="pass"><br><br>
Conform Password <input type=password name="pass2"><br><br>
Select Pic<input type=file name=pic><br><br>
<input type=submit value="Register"></table>
</form>
</body>
</html>
</div>