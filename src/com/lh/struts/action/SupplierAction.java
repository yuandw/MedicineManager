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
 * 供应商信息管理Action类
 * @author Li Hong
 */
public class SupplierAction extends BaseAction {
	
	//如果没有传递参数默认调用此方法
	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forword = new ActionForward("/login.jsp", true);
		return forword;
	}


	// 添加供应商
	public ActionForward supplierAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		SupplierForm cuf = (SupplierForm) form;
		if (cuf != null) {
				Supplier supplier = new Supplier();	// 实例化一个Supplier对象
				BeanUtils.copyProperties(supplier, cuf);	// 对supplier属性赋值
				SupplierDao dao = new SupplierDao();		// 实例化SupplierDao对象
				dao.save(supplier);	// 保存supplier对象
			
		}
		return mapping.findForward("supplierFind");
	}

	// 查找所有供应商
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

	// 删除供应商
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

	// 编辑供应商
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
