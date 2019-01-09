<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <title><bean:message key="system.category.buy.buy" /></title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../images/styles.css">

  </head>
  <body>
   <div class="div1">
		<table width="100%" cellpadding="0" cellspacing="0" border="0"
			align="center">
			<tr>
				<td class="td_title1">
					��<bean:message key="system.current.place"/>��
					<bean:message key="system.category.req"/>
					&gt;&gt; <bean:message key="system.category.buy.buy" />
				</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" height="50">
					<br>
    <html:form action="sell/sell.do" method="post" focus="sellCount">
      <table border="0" align="center" width="500">
        <tr>
          <td align="right"><bean:message key="medicine.name" />��</td>
          <td align="left">
          	<input type="hidden" name="command" value="order" />
          	<html:hidden property="medId"/>
          	<html:text property="sellName" readonly="true"/>
          </td>
        </tr>
        <tr>
          <td align="right"><bean:message key="medicine.price" />��</td>
          <td align="left"><html:text property="sellPrice" readonly="true"/></td>
        </tr>
        <tr>
          <td align="right"><bean:message key="system.count" />��</td>
          <td align="left"><html:text property="sellCount"/></td>
        </tr>
        <tr>
          <td align="right"><bean:message key="medicine.factoryAdd" />��</td>
          <td align="left"><html:text property="factoryAdd" readonly="true"/></td>
        </tr>
        <tr>
          <td align="center" colspan="2">
			<html:submit>
			<bean:message key="button.submit" />
			</html:submit>
		  </td>
        </tr>
      </table>
    </html:form>
     </td>
			</tr>
		</table>
	</div>
  </body>
</html:html>
