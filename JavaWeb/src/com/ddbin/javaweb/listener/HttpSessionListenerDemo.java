package com.ddbin.javaweb.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionIdListener;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class HttpSessionListenerDemo
 *
 */
@WebListener
public class HttpSessionListenerDemo implements HttpSessionListener, HttpSessionAttributeListener,
		HttpSessionActivationListener, HttpSessionIdListener, HttpSessionBindingListener {
	private String name = "hsld";

	@Override
	public String toString() {
		return "HttpSessionListenerDemo [name=" + name + "]";
	}

	/**
	 * Default constructor.
	 */
	public HttpSessionListenerDemo() {
		System.out.println("HttpSessionListenerDemo 构造函数...");
	}

	public HttpSessionListenerDemo(String name) {
		this.name = name;
	}

	/**
	 * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
	 */
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("HttpSessionListenerDemo---sessionCreated,id=" + arg0.getSession().getId());
		System.out.println("HttpSessionListenerDemo---sessionCreated,at:" + arg0.getSession().getCreationTime());
	}

	/**
	 * @see HttpSessionIdListener#sessionIdChanged(HttpSessionEvent, String)
	 */
	public void sessionIdChanged(HttpSessionEvent arg0, String arg1) {
		System.out.println("sessionIdChanged...");
		System.out.println("SessionListenerDemo --sessionIdChanged,旧的ID："+ arg1+" ，新的ID：" + arg0.getSession().getId());
	}

	/**
	 * @see HttpSessionBindingListener#valueBound(HttpSessionBindingEvent)
	 */
	public void valueBound(HttpSessionBindingEvent arg0) {
		System.out.println("session---valueBound" + arg0.getName() + "---" + arg0.getValue());
	}

	/**
	 * @see HttpSessionActivationListener#sessionDidActivate(HttpSessionEvent)
	 */
	public void sessionDidActivate(HttpSessionEvent arg0) {
		System.out.println("sessionDidActivate");
	}

	/**
	 * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
	 */
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		System.out.println("session---attributeAdded, " + arg0.getName() + "=" + arg0.getValue());
	}

	/**
	 * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
	 */
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		System.out.println("session---attributeRemoved, " + arg0.getName() + " removed!");
	}

	/**
	 * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
	 */
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		System.out.println("session---attributeReplaced, before：" + arg0.getName() + "=" + arg0.getValue());
		System.out.println("session---attributeReplaced, after：" + arg0.getName() + "="
				+ arg0.getSession().getAttribute(arg0.getName()));

	}

	/**
	 * @see HttpSessionActivationListener#sessionWillPassivate(HttpSessionEvent)
	 */
	public void sessionWillPassivate(HttpSessionEvent arg0) {
		System.out.println("sessionWillPassivate");
	}

	/**
	 * @see HttpSessionBindingListener#valueUnbound(HttpSessionBindingEvent)
	 */
	public void valueUnbound(HttpSessionBindingEvent arg0) {
		System.out.println("session---valueUnbound" + arg0.getName() + "---" + arg0.getValue());
	}

	/**
	 * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
	 */
	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println("HttpSessionListenerDemo--sessionDestroyed ,id=" + arg0.getSession().getId());
	}

}
