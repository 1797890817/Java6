package com.ddb.javacore.java8new;

import java.util.Optional;

//http://www.runoob.com/java/java8-optional-class.html
public class OptionalDemo {
	public static void main(String args[]) {
		OptionalDemo optionalDemo = new OptionalDemo();
		Integer value1 = null;
		Integer value2 = new Integer(10);

		// Optional.ofNullable - 允许传递为 null 参数
		Optional<Integer> a = Optional.ofNullable(value1);

		// Optional.of - 如果传递的参数是 null，抛出异常 NullPointerException
		Optional<Integer> b = Optional.of(value2);
		System.out.println(optionalDemo.sum(a, b));
		//System.out.println(optionalDemo.add(value1, value2));

		Integer mInteger = 3;
		Integer nInteger = 5;
		System.out.println(optionalDemo.add(mInteger, nInteger));

	}

	public Integer sum(Optional<Integer> a, Optional<Integer> b) {

		// Optional.isPresent - 判断值是否存在
		System.out.println("第一个参数值存在: " + a.isPresent());
		System.out.println("第二个参数值存在: " + b.isPresent());

		// Optional.orElse - 如果值存在，返回它，否则返回默认值
		Integer value1 = a.orElse(new Integer(0));

		// Optional.get - 获取值，值需要存在
		Integer value2 = b.get();
		return value1 + value2;
	}

	// 如果参数为空值，则会报空指针异常！
	public Integer add(Integer a, Integer b) {
		return a + b;
	}

}