package com.xml;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestApplicationContext {

	@Test
	public void testSpring(){
		ApplicationContext applicationContext = 
				new ClassPathXmlApplicationContext("applicationContext.xml");
	}
}