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
 * 客户信息管理Action类
 * @author Li Hong
 */
public class CustomerAction extends BaseAction {
	
	//如果没有传递参数默认调用此方法
	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forword = new ActionForward("/login.jsp", true);
		return forword;
	}


	// 添加客户
	public ActionForward customerAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CustomerForm cuf = (CustomerForm) form;
		if (cuf != null) {
				Customer customer = new Customer();	// 实例化一个Customer对象
				BeanUtils.copyProperties(customer, cuf);	// 对customer属性赋值
				CustomerDao dao = new CustomerDao();		// 实例化CustomerDao对象
				dao.save(customer);	// 保存customer对象
			
		}
		return mapping.findForward("customerFind");
	}

	// 查找所有客户
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

	// 删除客户
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

	// 编辑用户
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
