<%@ include file="shead.jsp" %>
<div style="position:absolute; top:250px; left:600px">
<script>
function validation()
{
var a=document.s.dname.value;
if(a=="")
{
alert("Enter Discussion");
document.s.dname.focus();
return false;
}
}
</script>
<form action="discuss1.jsp" onsubmit="return validation();" name="s">
Discussion Query :<textarea name=dname></textarea><br><br><br>
<input type=submit value="Publish">
</form>