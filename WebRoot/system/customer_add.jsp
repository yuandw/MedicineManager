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
	<title><bean:message key="system.customer_info.manage.add" />
	</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../images/styles.css">

	<script type="text/javascript">
		function save(){
			var form = document.forms["customerForm"];
			if(form.elements["customerno"].value == ""){
				alert("<bean:message key="customer.customerno.null"/>");
				form.elements["customerno"].focus();
				return false;
			}
			if(form.elements["customername"].value == ""){
				alert("<bean:message key="customer.customername.null"/>");
				form.elements["customername"].focus();
				return false;
			}
				if(form.elements["contactperson"].value == ""){
				alert("<bean:message key="customer.contactperson.null"/>");
				form.elements["contactperson"].focus();
				return false;
			}	
					if(form.elements["contacttel"].value == ""){
				alert("<bean:message key="customer.contacttel.null"/>");
				form.elements["contacttel"].focus();
				return false;
			}
					if(form.elements["contactaddress"].value == ""){
				alert("<bean:message key="customer.contactaddress.null"/>");
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
					��
					<bean:message key="system.current.place" />
					��
					<bean:message key="system.customer_info.manage" />
					&gt;&gt;
					<bean:message key="system.customer_info.manage.add" />
				</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" height="60">
					<br>
					<html:form action="system/customer.do" method="post"
						focus="customername" onsubmit="return save();">
						<table border="0" align="center" width="800">
							<tr>
								<td align="right">
									<bean:message key="customer.customerno" />
									��
								</td>
								<!-- �ͻ���� -->
								<td align="left">
									<input type="hidden" name="command" value="customerAdd" />
									<html:hidden property="id" />
									<html:text property="customerno" />
								</td>
								<td align="right">
									<bean:message key="customer.customername" />
									��
								</td>
								<!-- �ͻ����� -->
								<td align="left">
									<input type="hidden" name="command" value="customerAdd" />
									<html:hidden property="id" />
									<html:text property="customername" />
								</td>
							</tr>
							<tr>
								<td align="right">
									<bean:message key="customer.contactperson" />
									��
								</td>
								<!-- ��ϵ�� -->
								<td align="left">
									<input type="hidden" name="command" value="customerAdd" />
									<html:hidden property="id" />
									<html:text property="contactperson" />
								</td>
								<td align="right">
									<bean:message key="customer.contacttel" />
									��
								</td>
								<!-- ��ϵ�绰 -->
								<td align="left">
									<input type="hidden" name="command" value="customerAdd" />
									<html:hidden property="id" />
									<html:text property="contacttel" />
								</td>
							</tr>
							<tr>
								<td align="right">
									<bean:message key="customer.contactaddress" />
									��
								</td>
								<!-- ��ַ -->
								<td align="left" colspan=��3��>
									<input type="hidden" name="command" value="customerAdd" />
									<html:hidden property="id" />
									<html:text property="contactaddress" />
								</td>
							</tr>
							<tr>
								<td align="right">
									<bean:message key="customer.remark" />
									��
								</td>
								<!-- ��ע -->
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
