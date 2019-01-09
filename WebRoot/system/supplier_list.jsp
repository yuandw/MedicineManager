<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <title><bean:message key="system.supplier_info.manage.view"/></title>

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
					¡¤<bean:message key="system.current.place"/>£º
					<bean:message key="system.supplier_info.manage" />
					&gt;&gt; <bean:message key="system.supplier_info.manage.view"/>
				</td>
				
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" height="50">
					<br>
      <table border="1" align="center" width="500" cellpadding="1" cellspacing="1" bgcolor="#036500" bordercolor="#FFFFF">
        <tr bgcolor="#FFFFFF">
         <td class="tb_tl"><bean:message key="user.id"/></td>
          <td class="tb_tl"><bean:message key="supplier.supplierno"/></td>
          <td class="tb_tl"><bean:message key="supplier.suppliername"/></td>
          <td class="tb_tl"><bean:message key="supplier.contactperson"/></td>
          <td class="tb_tl"><bean:message key="supplier.contacttel"/></td>
          <td class="tb_tl"><bean:message key="supplier.contactaddress"/></td>
          <td class="tb_tl"><bean:message key="supplier.remark"/></td>
          <td class="tb_tl"><bean:message key="system.operate"/></td>
        </tr>
        <logic:present name="list" scope="request">
        	<logic:notEmpty name="list" scope="request">
	        	<logic:iterate id="ele" name="list" scope="request">
	        		<tr bgcolor="#FFFFFF">
	        		<td><bean:write name="ele" property="id"/></td>
	        			<td><bean:write name="ele" property="supplierno"/></td>
	        			<td>
	        				<bean:write name="ele" property="suppliername"/>
	        			</td>
	        			<td>
	        				<bean:write name="ele" property="contactperson"/>
	        			</td>
	        				<td>
	        				<bean:write name="ele" property="contacttel"/>
	        			</td>
	        				<td>
	        				<bean:write name="ele" property="contactaddress"/>
	        			</td>
	        				<td>
	        				<bean:write name="ele" property="remark"/>
	        			</td>
	        			<td>
	        				<html:link href="../system/supplier.do?command=supplierDelete" paramId="id" paramName="ele" paramProperty="id">
									<bean:message key="system.delete"/>
							</html:link>
	        			</td>
	        		</tr>
	        	</logic:iterate>
        	</logic:notEmpty>
        	<logic:empty name="list" scope="request">
        	<tr bgcolor="#FFFFFF">
	          <td colspan="7" align="center">
				<bean:message key="system.message.null"/>
			  </td>
	        </tr>
        	</logic:empty>
        </logic:present>
        <logic:notPresent name="list" scope="request">
        	<tr bgcolor="#FFFFFF">
	          <td colspan="7" align="center">
				<bean:message key="system.message.null"/>
			  </td>
	        </tr>
	    </logic:notPresent>
      </table>
      <br>
      </td>
			</tr>
		</table>
	</div>
  </body>
</html:html>
