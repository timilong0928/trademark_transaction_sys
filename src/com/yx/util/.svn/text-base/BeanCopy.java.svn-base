package com.yx.util;
 
import java.lang.reflect.Field;
 
public class BeanCopy {
	/**
	 * 将源对象里非null的值给目标对象
	 * 注意:类不能有基本类型!
	 * @param source 源对象
	 * @param target 目标对象
	 * @throws Exception
	 */
    public static void beanCopy(Object source, Object target) throws Exception {
        if (source == null || target == null) {
            throw new Exception("param is null.");
        }
        Field sourceField[] = source.getClass().getDeclaredFields();
        Field targetField[] = target.getClass().getDeclaredFields();
        if (sourceField == null || sourceField.length == 0) {
            throw new Exception("Source bean no properties.");
        }
        if (targetField == null || targetField.length == 0) {
            throw new Exception("Target bean no properties.");
        }
        for (Field tf : targetField) {
            tf.setAccessible(true);
            if(tf.get(source)!=null){
            	tf.set(target, tf.get(source));
            }
          // 	for (Field sf : sourceField) {
          //    sf.setAccessible(true);
          //  	String tfType = tf.getType().getName();
          //	String sfType = sf.getType().getName();
          //	if (tf.getName().equals(sf.getName()) && tfType.equals(sfType)&&!"null".equals(sf.get(source))) {
          //    tf.set(target, sf.get(source));
          //    break;
          //      }
        //    }
        }
    }
 
    public static void main(String[] args) {
 
        A a = new A();
       // a.setName("asd");
       // a.setAge(15);
        a.setEmail("zhangsan@163.com");
 
        A b = new A();
        b.setName("李四");
        b.setAge(20);
        b.setEmail("lisi@163.com");
 
        try {
            beanCopy(a, b);
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        System.out.println(b.getName());
        System.out.println(b.getAge()); // A 和 B 类型不同所以没有copy
        System.out.println(b.getEmail());
    }
}
 
class A {
    private String name;
    private Integer age;
    private String email;
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public int getAge() {
        return age;
    }
 
    public void setAge(int age) {
        this.age = age;
    }
 
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
}
 
class B {
 
    private String name;
    private Integer age;
    private String email;
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public Integer getAge() {
        return age;
    }
 
    public void setAge(Integer age) {
        this.age = age;
    }
 
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
}