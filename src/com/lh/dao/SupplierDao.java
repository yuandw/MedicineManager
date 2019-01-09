package com.lh.dao;

import org.hibernate.Query;
import com.lh.persistence.Supplier;
import com.lh.util.HibernateFilter;

/**
 * 供应商数据库操作类 用于查询供应商
 * 
 * @author Li Hong
 */
public class SupplierDao extends SupperDao {
	/**
	 * 查询供应商
	 * 
	 * @param supplierno
	 *@param suppliername
	 *@param contactperson
	 * @return Supplier
	 */
	public Supplier find(String supplierno, String suppliername,
			String contactperson) {
		Supplier cuser = null;
		try {
			session = HibernateFilter.getSession(); // 获取Session对象
			session.beginTransaction(); // 开启事物
			// HQL查询语句
			String hql = "from Supplier u where u.supplierno=? and u.suppliername=? and u.contactperson=?";
			Query query = session.createQuery(hql) // 创建Query对象
					.setParameter(0, supplierno)// 动态赋值
					.setParameter(1, suppliername) // 动态赋值
					.setParameter(2, contactperson);// 动态赋值
			cuser = (Supplier) query.uniqueResult(); // 返回Supplier对象
			session.getTransaction().commit(); // 提交事物
		} catch (Exception e) {
			e.printStackTrace(); // 打印异常信息
			session.getTransaction().rollback(); // 回滚事物
		}
		return cuser;
	}

	/**
	 * 根据id查询客户
	 * 
	 * @param id
	 * @return Supplier
	 */
	public Supplier loadUser(int id) {
		Supplier cuser = null;
		try {
			session = HibernateFilter.getSession(); // 获取Session对象
			session.beginTransaction(); // 开启事物
			// 根据id加载用户
			cuser = (Supplier) session.load(Supplier.class, new Integer(id));
			session.getTransaction().commit(); // 提交事物
		} catch (Exception e) {
			e.printStackTrace(); // 打印异常信息
			session.getTransaction().rollback(); // 回滚事物
		}
		return cuser;
	}

}
