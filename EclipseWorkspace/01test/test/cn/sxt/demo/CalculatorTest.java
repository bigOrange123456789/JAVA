package cn.sxt.demo;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class CalculatorTest {
	Calculator calcu;
	
	@Before
	public void setUp() {
		calcu=new Calculator();
	}
	//这个注解表示这是一个测试类
	@Test
	public void testAdd() {
		int result =calcu.add(3,4);
		Assert.assertEquals(7,result);//Assert是一个断言类
		//System.out.println("add");
	}
	@Test
	public void testSubstract() {
		int result =calcu.sub(3,4);
		Assert.assertEquals(-1,result);//Assert是一个断言类
	}	
	@After
	public void clear() {
		System.out.println("clear");
	}
}
