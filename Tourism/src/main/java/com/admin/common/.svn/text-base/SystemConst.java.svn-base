package com.admin.common;

import java.lang.reflect.Method;

public class SystemConst {

	public enum ScenicTyep {
		natural(1, "自然风光"),
		history(2, "历史人文");
		
		private final int value;
		private final String name;
		private ScenicTyep(int value, String name) {
			this.value = value;
			this.name = name;
		}
		public int getValue() {
			return value;
		}
		public String getName() {
			return name;
		}
	}
	

	/**
	 * 根据vaue获取当前所属枚举实例.
	 * 用法：SystemConst.getEnum(CourtState.values(), 1)
	 * @param values 枚举实例数组
	 * @param value 值
	 * @return
	 */
	public static Enum<?> getEnum(Enum<?>[] values, Object value) {
		try {
			for(Enum<?> en : values) {
				Method m = en.getDeclaringClass().getMethod("getValue");
				if(value.toString().equals(m.invoke(en).toString())) {
					return en;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据根据vaue执行枚举类的方法
	 * 用法：SystemConst.execEnumFun(CourtState.values(), 1, "getName")
	 * @param values 枚举实例数组
	 * @param value 值
	 * @param fun 方法名称
	 * @return
	 */
	public static Object execEnumFun(Enum<?>[] values, Object value, String fun) {
		Enum<?> en = getEnum(values, value);
		try {
			Method m = en.getDeclaringClass().getMethod(fun);
			return m.invoke(en);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
