package com.shop.action;

import javax.servlet.ServletContextEvent;

import org.springframework.web.context.ContextLoaderListener;

import com.shop.ylsdk.SDKConfig;

public class ServletContextLTest extends ContextLoaderListener{ 
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		SDKConfig.getConfig().loadPropertiesFromSrc();
		super.contextInitialized(event);
	}
}
