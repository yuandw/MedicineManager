package com.lh.dao;

import org.hibernate.Query;

import com.lh.persistence.Customer;
import com.lh.persistence.User;
import com.lh.util.HibernateFilter;

/**
 * �ͻ����ݿ������ ���ڲ�ѯ�ͻ�
 * 
 * @author Li Hong
 */
public class CustomerDao extends SupperDao {
	/**
	 * ��ѯ�ͻ�
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
			session = HibernateFilter.getSession(); // ��ȡSession����
			session.beginTransaction(); // ��������
			// HQL��ѯ���
			String hql = "from Customer u where u.customerno=? and u.customername=? and u.contactperson=?";
			Query query = session.createQuery(hql) // ����Query����
					.setParameter(0, customerno)// ��̬��ֵ
					.setParameter(1, customername) // ��̬��ֵ
					.setParameter(2, contactperson);// ��̬��ֵ
			cuser = (Customer) query.uniqueResult(); // ����Customer����
			session.getTransaction().commit(); // �ύ����
		} catch (Exception e) {
			e.printStackTrace(); // ��ӡ�쳣��Ϣ
			session.getTransaction().rollback(); // �ع�����
		}
		return cuser;
	}

	/**
	 * ����id��ѯ�ͻ�
	 * 
	 * @param id
	 * @return Customer
	 */
	public Customer loadUser(int id) {
		Customer cuser = null;
		try {
			session = HibernateFilter.getSession(); // ��ȡSession����
			session.beginTransaction(); // ��������
			// ����id�����û�
			cuser = (Customer) session.load(Customer.class, new Integer(id));
			session.getTransaction().commit(); // �ύ����
		} catch (Exception e) {
			e.printStackTrace(); // ��ӡ�쳣��Ϣ
			session.getTransaction().rollback(); // �ع�����
		}
		return cuser;
	}

}
