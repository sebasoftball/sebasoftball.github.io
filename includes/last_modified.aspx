<p class="smallw">Last updated: 
<%
String fullname = Request.PhysicalApplicationPath;
DateTime dt = System.IO.File.GetLastWriteTime(fullname);
Response.Write(dt.ToString("dd/MM/yy HH:mm:ss"));
%>
</p>