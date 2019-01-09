package com.lh.dao;

import org.hibernate.Query;

import com.lh.persistence.Customer;
import com.lh.persistence.User;
import com.lh.util.HibernateFilter;

/**
 * 客户数据库操作类 用于查询客户
 * 
 * @author Li Hong
 */
public class CustomerDao extends SupperDao {
	/**
	 * 查询客户
	 * 
	 * @param customerno
	 *@param customername
	 *@param contactperson
	 * @return Customer
	 */
	public Customer find(String customerno, String customername,
			String contactperson) {
		Customer cuser = null;
		try {
			session = HibernateFilter.getSession(); // 获取Session对象
			session.beginTransaction(); // 开启事物
			// HQL查询语句
			String hql = "from Customer u where u.customerno=? and u.customername=? and u.contactperson=?";
			Query query = session.createQuery(hql) // 创建Query对象
					.setParameter(0, customerno)// 动态赋值
					.setParameter(1, customername) // 动态赋值
					.setParameter(2, contactperson);// 动态赋值
			cuser = (Customer) query.uniqueResult(); // 返回Customer对象
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
	 * @return Customer
	 */
	public Customer loadUser(int id) {
		Customer cuser = null;
		try {
			session = HibernateFilter.getSession(); // 获取Session对象
			session.beginTransaction(); // 开启事物
			// 根据id加载用户
			cuser = (Customer) session.load(Customer.class, new Integer(id));
			session.getTransaction().commit(); // 提交事物
		} catch (Exception e) {
			e.printStackTrace(); // 打印异常信息
			session.getTransaction().rollback(); // 回滚事物
		}
		return cuser;
	}

}
