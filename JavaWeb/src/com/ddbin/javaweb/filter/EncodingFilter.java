package com.ddbin.javaweb.filter;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

/**
 * Servlet Filter implementation class EncodingFilter
 */
//@WebFilter(
//		dispatcherTypes = {
//				DispatcherType.REQUEST, 
//				DispatcherType.FORWARD, 
//				DispatcherType.INCLUDE, 
//				DispatcherType.ERROR
//		}
//					, 
//		urlPatterns = { "/*" }, 
//		initParams = { 
//				@WebInitParam(name = "charset", value = "UTF-8")
//		})
public class EncodingFilter implements Filter {
	private String charset="";

    /**
     * Default constructor. 
     */
    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("进入EncodingFilter init...");
		charset = fConfig.getInitParameter("charset");
		System.out.println("charset = " + charset);
		System.out.println("离开EncodingFilter init...");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("EncodingFilter doFilter start...");
		request.setCharacterEncoding(charset);
		response.setCharacterEncoding(charset);
		// pass the request along the filter chain
		chain.doFilter(request, response);
		System.out.println("EncodingFilter doFilter end...");
	}

	

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		System.out.println("EncodingFilter destroy...");
	}
	
}
