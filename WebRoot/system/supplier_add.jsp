<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
<head>
	<title><bean:message key="system.supplier_info.manage.add" />
	</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../images/styles.css">
	
	<script type="text/javascript">
		function save(){
			var form = document.forms["supplierForm"];
			if(form.elements["supplierno"].value == ""){
				alert("<bean:message key="supplier.supplierno.null"/>");
				form.elements["supplierno"].focus();
				return false;
			}
			if(form.elements["suppliername"].value == ""){
				alert("<bean:message key="supplier.suppliername.null"/>");
				form.elements["suppliername"].focus();
				return false;
			}
				if(form.elements["contactperson"].value == ""){
				alert("<bean:message key="supplier.contactperson.null"/>");
				form.elements["contactperson"].focus();
				return false;
			}	
					if(form.elements["contacttel"].value == ""){
				alert("<bean:message key="supplier.contacttel.null"/>");
				form.elements["contacttel"].focus();
				return false;
			}
					if(form.elements["contactaddress"].value == ""){
				alert("<bean:message key="supplier.contactaddress.null"/>");
				form.elements["contactaddress"].focus();
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
					·
					<bean:message key="system.current.place" />
					：
					<bean:message key="system.supplier_info.manage" />
					&gt;&gt;
					<bean:message key="system.supplier_info.manage.add" />
				</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" height="60">
					<br>
					<html:form action="system/supplier.do" method="post"
						focus="suppliername" onsubmit="return save();">
						<table border="0" align="center" width="800">
							<tr>
								<td align="right">
									<bean:message key="supplier.supplierno" />
									：
								</td>
								<!-- 客户编号 -->
								<td align="left">
									<input type="hidden" name="command" value="supplierAdd" />
									<html:hidden property="id" />
									<html:text property="supplierno" />
								</td>
								<td align="right">
									<bean:message key="supplier.suppliername" />
									：
								</td>
								<!-- 客户名称 -->
								<td align="left">
									<input type="hidden" name="command" value="supplierAdd" />
									<html:hidden property="id" />
									<html:text property="suppliername" />
								</td>
							</tr>
							<tr>
								<td align="right">
									<bean:message key="supplier.contactperson" />
									：
								</td>
								<!-- 联系人 -->
								<td align="left">
									<input type="hidden" name="command" value="supplierAdd" />
									<html:hidden property="id" />
									<html:text property="contactperson" />
								</td>
								<td align="right">
									<bean:message key="supplier.contacttel" />
									：
								</td>
								<!-- 联系电话 -->
								<td align="left">
									<input type="hidden" name="command" value="supplierAdd" />
									<html:hidden property="id" />
									<html:text property="contacttel" />
								</td>
							</tr>
							<tr>
								<td align="right">
									<bean:message key="supplier.contactaddress" />
									：
								</td>
								<!-- 地址 -->
								<td align="left" colspan=“3”>
									<input type="hidden" name="command" value="supplierAdd" />
									<html:hidden property="id" />
									<html:text property="contactaddress" />
								</td>
							</tr>
							<tr>
								<td align="right">
									<bean:message key="supplier.remark" />
									：
								</td>
								<!-- 备注 -->
								<td align="left">
									<html:textarea property="remark" cols="60" rows="3"></html:textarea>
								</td>
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
