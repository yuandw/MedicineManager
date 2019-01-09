package com.lh.dao;

import org.hibernate.Query;
import com.lh.persistence.Supplier;
import com.lh.util.HibernateFilter;

/**
 * ��Ӧ�����ݿ������ ���ڲ�ѯ��Ӧ��
 * 
 * @author Li Hong
 */
public class SupplierDao extends SupperDao {
	/**
	 * ��ѯ��Ӧ��
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
			session = HibernateFilter.getSession(); // ��ȡSession����
			session.beginTransaction(); // ��������
			// HQL��ѯ���
			String hql = "from Supplier u where u.supplierno=? and u.suppliername=? and u.contactperson=?";
			Query query = session.createQuery(hql) // ����Query����
					.setParameter(0, supplierno)// ��̬��ֵ
					.setParameter(1, suppliername) // ��̬��ֵ
					.setParameter(2, contactperson);// ��̬��ֵ
			cuser = (Supplier) query.uniqueResult(); // ����Supplier����
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
	 * @return Supplier
	 */
	public Supplier loadUser(int id) {
		Supplier cuser = null;
		try {
			session = HibernateFilter.getSession(); // ��ȡSession����
			session.beginTransaction(); // ��������
			// ����id�����û�
			cuser = (Supplier) session.load(Supplier.class, new Integer(id));
			session.getTransaction().commit(); // �ύ����
		} catch (Exception e) {
			e.printStackTrace(); // ��ӡ�쳣��Ϣ
			session.getTransaction().rollback(); // �ع�����
		}
		return cuser;
	}

}
