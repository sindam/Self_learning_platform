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
var a=document.s.sid.value;
if(a=="")
{
alert("Enter Student ID");
document.s.sid.focus();
return false;
}
var b=document.s.pass.value;
if(b=="")
{
alert("Enter Student Password");
document.s.pass.focus();
return false;
}
}
</script>
<input type="checkbox" checked = "checked" onclick="myFunction()">Student 
 <input type="checkbox"  onclick="myFunction1()">Instructor
 
<br><br>
<form name="s" action="slogin1.jsp" method="post" onsubmit="return validation();">
Student ID<input type=text name="sid"><br><br>
Password <input type=password name="pass"><br><br>
<input type=submit value="Login">
</form>