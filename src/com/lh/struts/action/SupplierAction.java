package com.lh.struts.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.lh.dao.SupplierDao;
import com.lh.persistence.Supplier;
import com.lh.struts.form.SupplierForm;
/**
 * ��Ӧ����Ϣ����Action��
 * @author Li Hong
 */
public class SupplierAction extends BaseAction {
	
	//���û�д��ݲ���Ĭ�ϵ��ô˷���
	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forword = new ActionForward("/login.jsp", true);
		return forword;
	}


	// ��ӹ�Ӧ��
	public ActionForward supplierAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		SupplierForm cuf = (SupplierForm) form;
		if (cuf != null) {
				Supplier supplier = new Supplier();	// ʵ����һ��Supplier����
				BeanUtils.copyProperties(supplier, cuf);	// ��supplier���Ը�ֵ
				SupplierDao dao = new SupplierDao();		// ʵ����SupplierDao����
				dao.save(supplier);	// ����supplier����
			
		}
		return mapping.findForward("supplierFind");
	}

	// �������й�Ӧ��
	@SuppressWarnings("unchecked")
	public ActionForward supplierFind(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		SupplierDao dao = new SupplierDao();
		List list = dao.findByHQL("from Supplier");
		if (list != null) {
			request.setAttribute("list", list);
		}
		return mapping.findForward("findAllSuccess");
	}

	// ɾ����Ӧ��
	public ActionForward supplierDelete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		SupplierForm uf = (SupplierForm) form;
		if (uf.getId() > 0) {
					SupplierDao dao = new SupplierDao();
					dao.deleteByHQL("delete from Supplier u where u.id = " + uf.getId());
		}
		return mapping.findForward("supplierFind");
	}

	// �༭��Ӧ��
	public ActionForward supplierEdit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		SupplierForm uf = (SupplierForm) form;
		if (Integer.valueOf(uf.getSupplierno()) > 0) {
			SupplierDao dao = new SupplierDao();
			Supplier user = dao.loadUser(Integer.valueOf(uf.getSupplierno()));
			BeanUtils.copyProperties(uf, user);
		}
		return mapping.findForward("supplierEdit");
	}
}
