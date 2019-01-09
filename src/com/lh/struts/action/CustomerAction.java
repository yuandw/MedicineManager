package com.lh.struts.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


import com.lh.dao.CustomerDao;
import com.lh.persistence.Customer;
import com.lh.struts.form.CustomerForm;
/**
 * �ͻ���Ϣ����Action��
 * @author Li Hong
 */
public class CustomerAction extends BaseAction {
	
	//���û�д��ݲ���Ĭ�ϵ��ô˷���
	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forword = new ActionForward("/login.jsp", true);
		return forword;
	}


	// ��ӿͻ�
	public ActionForward customerAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CustomerForm cuf = (CustomerForm) form;
		if (cuf != null) {
				Customer customer = new Customer();	// ʵ����һ��Customer����
				BeanUtils.copyProperties(customer, cuf);	// ��customer���Ը�ֵ
				CustomerDao dao = new CustomerDao();		// ʵ����CustomerDao����
				dao.save(customer);	// ����customer����
			
		}
		return mapping.findForward("customerFind");
	}

	// �������пͻ�
	public ActionForward customerFind(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CustomerDao dao = new CustomerDao();
		List list = dao.findByHQL("from Customer");
		if (list != null) {
			request.setAttribute("list", list);
		}
		return mapping.findForward("findAllSuccess");
	}

	// ɾ���ͻ�
	public ActionForward customerDelete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CustomerForm uf = (CustomerForm) form;
		if (uf.getId() > 0) {
					CustomerDao dao = new CustomerDao();
					dao.deleteByHQL("delete from Customer u where u.id = " + uf.getId());
		}
		return mapping.findForward("customerFind");
	}

	// �༭�û�
	public ActionForward customerEdit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		CustomerForm uf = (CustomerForm) form;
		if (Integer.valueOf(uf.getCustomerno()) > 0) {
			CustomerDao dao = new CustomerDao();
			Customer user = dao.loadUser(Integer.valueOf(uf.getCustomerno()));
			BeanUtils.copyProperties(uf, user);
		}
		return mapping.findForward("customerEdit");
	}
}
