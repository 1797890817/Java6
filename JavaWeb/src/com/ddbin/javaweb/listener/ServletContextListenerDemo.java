package com.ddbin.javaweb.listener;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class
 * ServletContextListenerDemo
 *
 */
//@WebListener
public class ServletContextListenerDemo implements ServletContextListener, ServletContextAttributeListener {

	/**
	 * Default constructor.
	 */
	public ServletContextListenerDemo() {
		System.out.println("ServletContextListenerDemo init...");
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("app contextInitialized...");
		// System.out.println(arg0.getServletContext().getAttribute(arg0.getSource().));
	}

	/**
	 * @see ServletContextAttributeListener#attributeAdded(ServletContextAttributeEvent)
	 */
	public void attributeAdded(ServletContextAttributeEvent arg0) {
		System.out.println("app--- attributeAdded!");
		System.out.println(arg0.getName() + "=" + arg0.getValue());

	}

	/**
	 * @see ServletContextAttributeListener#attributeReplaced(ServletContextAttributeEvent)
	 */
	public void attributeReplaced(ServletContextAttributeEvent arg0) {
		System.out.println("app--- attributeReplaced!");
		System.out.println("replace before:" + arg0.getName() + "=" + arg0.getValue());
		System.out.println(
				"replace after:" + arg0.getName() + "=" + arg0.getServletContext().getAttribute(arg0.getName()));

	}

	/**
	 * @see ServletContextAttributeListener#attributeRemoved(ServletContextAttributeEvent)
	 */
	public void attributeRemoved(ServletContextAttributeEvent arg0) {

		System.out.println("app--- attributeRemoved!");
		System.out.println("app: "+arg0.getName()+ " removed!");
		

	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("app ---contextDestroyed");
	}

}
