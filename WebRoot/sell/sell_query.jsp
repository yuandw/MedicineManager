<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <title><bean:message key="sell.time.query"/></title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../images/styles.css">
	<script type="text/javascript">
		function query(){
			var form = document.forms["queryForm"];
			var v1 = form.elements["begin"].value;
			var v2 = form.elements["end"].value;
			var reg = /^[1-9]\d{3}\-\d{1,2}-\d{1,2}$/;
			if(v1 == ""){
				alert("<bean:message key="sell.time.start.null"/>");
				form.elements["begin"].focus();
				return false;
			}
			if(v2 == ""){
				alert("<bean:message key="sell.time.end.null"/>");
				form.elements["end"].focus();
				return false;
			}
			if(!reg.test(v1)){
				alert("<bean:message key="sell.time.start.error"/>");
				form.elements["begin"].focus();
				return false;
			}
			if(!reg.test(v2)){
				alert("<bean:message key="sell.time.end.error"/>");
				form.elements["begin"].focus();
				return false;
			}
		}
	</script>
  </head>
  <body>
  <div class="div1">
		<table width="100%" cellpadding="0" cellspacing="0" border="0"
			align="center">
			<tr>
				<td class="td_title1">
					��<bean:message key="system.current.place"/>��
					<bean:message key="system.category.sell"/>
					&gt;&gt; <bean:message key="sell.time.query"/>
				</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" height="50">
					<br>
    <form name="queryForm" action="sell.do" method="post" onsubmit="return query();">
    	<input type="hidden" name="command" value="today" />
      <table border="0" align="center" width="500">
        <tr>
          <td align="right"><bean:message key="sell.time.start"/>��</td>
          <td align="left">
          	<input name="begin" type="text" />
          	<bean:message key="system.format"/>��yyyy-mm-dd
          </td>
        </tr>
        <tr>
          <td align="right"><bean:message key="sell.time.end"/>��</td>
          <td align="left">
	          <input name="end" type="text" />
	          <bean:message key="system.format"/>��yyyy-mm-dd
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center">
          	<input type="submit" value="<bean:message key="button.query" />">
          </td>
        </tr>
      </table>
    </form>
     </td>
			</tr>
		</table>
	</div>
  </body>
</html:html>
