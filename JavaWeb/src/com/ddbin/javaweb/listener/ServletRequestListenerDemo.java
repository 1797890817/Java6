package com.ddbin.javaweb.listener;

import javax.servlet.AsyncEvent;
import javax.servlet.AsyncListener;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;

/**
 * Application Lifecycle Listener implementation class
 * ServletRequestListenerDemo
 *
 */
@WebListener
public class ServletRequestListenerDemo
		implements ServletRequestListener, ServletRequestAttributeListener, AsyncListener {

	/**
	 * Default constructor.
	 */
	public ServletRequestListenerDemo() {
		System.out.println("ServletRequestListenerDemo 构造函数...");
	}

	/**
	 * @see AsyncListener#onComplete(AsyncEvent)
	 */
	public void onComplete(AsyncEvent arg0) throws java.io.IOException {
		System.out.println("ServletRequestListenerDemo onComplete");
	}

	/**
	 * @see ServletRequestListener#requestDestroyed(ServletRequestEvent)
	 */
	public void requestDestroyed(ServletRequestEvent arg0) {
		System.out.println("ServletRequestListenerDemo requestDestroyed...");
	}

	/**
	 * @see ServletRequestAttributeListener#attributeRemoved(ServletRequestAttributeEvent)
	 */
	public void attributeRemoved(ServletRequestAttributeEvent arg0) {
		System.out.println("ServletRequestListenerDemo attributeRemoved:" + arg0.getName());
	}

	/**
	 * @see AsyncListener#onError(AsyncEvent)
	 */
	public void onError(AsyncEvent arg0) throws java.io.IOException {
		HttpServletRequest request = (HttpServletRequest) arg0.getAsyncContext().getRequest();
		System.out.println("ServletRequestListenerDemo onError:"+request.getRequestURL());
	}

	/**
	 * @see AsyncListener#onStartAsync(AsyncEvent)//目前捕捉不到
	 */
	public void onStartAsync(AsyncEvent arg0) throws java.io.IOException {
		HttpServletRequest request = (HttpServletRequest) arg0.getAsyncContext().getRequest();
		System.out.println("ServletRequestListenerDemo onStartAsync:"+request.getRequestURL());
	}

	/**
	 * @see ServletRequestListener#requestInitialized(ServletRequestEvent)
	 */
	public void requestInitialized(ServletRequestEvent arg0) {
		HttpServletRequest httpServletRequest = (HttpServletRequest) arg0.getServletRequest();
		System.out.println("ServletRequestListenerDemo requestInitialized:" + httpServletRequest.getRequestURL());
	}

	/**
	 * @see ServletRequestAttributeListener#attributeAdded(ServletRequestAttributeEvent)
	 */
	public void attributeAdded(ServletRequestAttributeEvent arg0) {
		System.out.println("ServletRequestListenerDemo attributeAdded:" + arg0.getName() + " = " + arg0.getValue());
	}

	/**
	 * @see AsyncListener#onTimeout(AsyncEvent)
	 */
	public void onTimeout(AsyncEvent arg0) throws java.io.IOException {
		HttpServletRequest request = (HttpServletRequest) arg0.getAsyncContext().getRequest();
		System.out.println("ServletRequestListenerDemo onTimeout:"+request.getRequestURL());
	}

	/**
	 * @see ServletRequestAttributeListener#attributeReplaced(ServletRequestAttributeEvent)
	 */
	public void attributeReplaced(ServletRequestAttributeEvent arg0) {
		System.out.println(
				"ServletRequestListenerDemo attributeReplaced,before : " + arg0.getName() + "=" + arg0.getValue());
		System.out.println("ServletRequestListenerDemo attributeReplaced,after:" + arg0.getName() + "="
				+ arg0.getServletRequest().getAttribute(arg0.getName()));

	}

}
