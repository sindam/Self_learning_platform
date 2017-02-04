<%@ include file="ihead.jsp" %>
<div style="position:absolute; top:250px; left:600px">
<script>
function validation()
{
var a=document.s.sub.value;
if(a=="")
{
alert("Enter Subject Name");
document.s.sub.focus();
return false;
}
}
</script>
<br><br>
<form action="addsub1.jsp" onsubmit="return validation();" name="s">
Enter Subject Name <input type=text name=sub>
<input type=submit value="ADD">
</form>