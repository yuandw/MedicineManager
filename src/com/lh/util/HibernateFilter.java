package com.lh.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
/**
 * Hibenrate������
 * ���ڳ�ʼ��Session��������ȡSession����
 * ͨ��ThreadLocal���й���Session
 * @author Li Hong
 */
public class HibernateFilter implements Filter{
	// ThreadLocal����
	@SuppressWarnings("unchecked")
	private static ThreadLocal threadLocal = new ThreadLocal();
	// SessionFactory����
	private static SessionFactory factory = null;
	public void destroy() {
		if(factory!=null){
		if(!factory.isClosed()){
			factory.close();
		}
		}
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		try {
			chain.doFilter(request, response);
		} finally{
			Session session = (Session)threadLocal.get();
			if(session != null){
				if(session.isOpen()){
					session.close();
				}
				threadLocal.remove();
			}
		}
	}
	public void init(FilterConfig arg0) throws ServletException {
		//��ʼ��SessionFactory
		try {
			Configuration cfg = new Configuration().configure();
			factory = cfg.buildSessionFactory();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * ��ȡSession
	 * @return Session
	 */
	@SuppressWarnings("unchecked")
	public static Session getSession() {
		Session session = (Session)threadLocal.get();
		if (session == null) {
			session = factory.openSession();
			threadLocal.set(session);
		}
		return session;
	}
}
