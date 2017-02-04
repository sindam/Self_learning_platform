<%@ include file="ihead.jsp" %>
<div style="position:absolute; top:250px; left:630px">
<script>
function validation()
{
var a=document.s.question.value;
if(a=="")
{
alert("Enter Question");
document.s.question.focus();
return false;
}
var b=document.s.opt1.value;
if(b=="")
{
alert("Enter Option One");
document.s.opt1.focus();
return false;
}
var c=document.s.opt2.value;
if(c=="")
{
alert("Enter Option Two");
document.s.opt2.focus();
return false;
}
var d=document.s.opt3.value;
if(d=="")
{
alert("Enter Option Three");
document.s.opt3.focus();
return false;
}
var e=document.s.opt4.value;
if(e=="")
{
alert("Enter Option Four");
document.s.opt4.focus();
return false;
}
var f=document.s.ans.value;
if(f=="")
{
alert("Enter Answer");
document.s.ans.focus();
return false;
}
var g=document.s.opt1.value;
var h=document.s.opt2.value;
var i=document.s.opt3.value;
var j=document.s.opt4.value;
var k=document.s.ans.value;
if(!(g==k || h==k || i==k || j==k))
{
	alert("Please Enter Valid Answer");
	document.s.ans.focus();
	return false;
}
}
</script>
<%
int qid=Integer.parseInt(request.getParameter("qid"));
int que=Integer.parseInt(request.getParameter("que"));
int qnum=Integer.parseInt(request.getParameter("qnum"));
if(que<qnum)
{
	out.println(que+" Question Added Successfully");
}else
{
%>
<form name="s" action="addquestion2.jsp" method="post" onsubmit="return validation();" enctype="multipart/form-data">

<input type=hidden name=qid value="<%=qid%>">
<input type=hidden name=que value="<%=que%>">
Question Number<input type=text name=qnum value="<%=qnum%>" readonly size=6><br><br>
Question <input type=text name=question size=40><br><br>

Option A<input type=text name=opt1><br><br>
Option B<input type=text name=opt2><br><br>
Option C<input type=text name=opt3><br><br>
Option D<input type=text name=opt4><br><br>
Answer<input type=text name=ans><br><br>
Image <input type=file name="file"><br><br>
<input type=submit <%if((que)==qnum){%>value="Finish" <%}else{ %> value="Next" <%} %>>

</form>
<a href="instructorhome.jsp"><input type=button value="Add Later"></a>
<%} %>