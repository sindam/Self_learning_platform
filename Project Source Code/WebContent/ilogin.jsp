<%@ include file="mainhead.jsp" %>
<div style="position:absolute; top:250px; left:630px">
<script>
function myFunction() {
    window.open("slogin.jsp","_self");
}
function myFunction1() {
    window.open("ilogin.jsp","_self");
}
</script>
<script>
function validation()
{
var a=document.s.uname.value;
if(a=="")
{
alert("Enter Instructor User Name");
document.s.uname.focus();
return false;
}
var b=document.s.pass.value;
if(b=="")
{
alert("Enter Instructor Password");
document.s.pass.focus();
return false;
}
}
</script>
<input type="checkbox"  onclick="myFunction()">Student 
 <input type="checkbox" checked = "checked" onclick="myFunction1()">Instructor
 <br><br>
<form name="s" action="ilogin1.jsp" method="post" onsubmit="return validation();">
User Name <input type=text name="uname"><br><br>
Password <input type=password name="pass"><br><br>
<input type=submit value="Login">
</form>