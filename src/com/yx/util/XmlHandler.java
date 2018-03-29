package com.yx.util;
import java.io.Writer;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;

public class XmlHandler {
	private Document document;
    private Element rootElment;

	/**
	 * 将XML字符串转换成Map
	 * @param xmlStr  需要转换的文档字符串
	 * @return	解析后的Map
	 * @throws DocumentException 
	 */
	@SuppressWarnings("unchecked")
	public Map<String, String> simpleXml2Map(String xmlStr) throws DocumentException{
		Map<String, String>	resultMap = new HashMap<String, String>();
		if (StringUtils.isNotEmpty(xmlStr)) {
			document = DocumentHelper.parseText(xmlStr);
	        rootElment = document.getRootElement();
			
	        Iterator<Object> childEles = rootElment.elementIterator();
	        while(childEles.hasNext()){
	        	Element item = (Element)childEles.next();
	        	resultMap.put(item.getName(), item.getTextTrim());
	        }
		}
		return resultMap;
	}
	
	/**
	 * 将Map数据转换成XML字符串
	 * @param paramMap
	 * @return
	 */
	public String Map2Xml(Map<String, String> paramMap){
		document = DocumentHelper.createDocument();
		rootElment = document.addElement("xml");
		Iterator<String> it = paramMap.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			String value = paramMap.get(key);
			Element ele = rootElment.addElement(key);
			ele.setText(value);
		}
		return document.getRootElement().asXML();
	}
	
	/**
	 * 将实体对象转换成xml
	 * @param <T>
	 * @param obj
	 * 		对象
	 * @return
	 */
	public static <T> String objectToXml(T obj){
		//以<xml></xml>包裹
		xstream2.alias("xml", obj.getClass());
		String xmlStr = xstream2.toXML(obj);
		return xmlStr.replace("__", "_");
	}
	
	/**
	 * 扩展xstream 
	 * 
	 * @date 2016-1-11
	 */
	private static XStream xstream2 = new XStream(new XppDriver() {
		public HierarchicalStreamWriter createWriter(Writer out) {
			return new PrettyPrintWriter(out) {
				// 对所有xml节点的转换都不增加CDATA标记
				boolean cdata = false;

				@SuppressWarnings("rawtypes")
				public void startNode(String name, Class clazz) {
					super.startNode(name, clazz);
				}

				protected void writeText(QuickWriter writer, String text) {
					if (cdata) {
						writer.write("<![CDATA[");
						writer.write(text);
						writer.write("]]>");
					} else {
						writer.write(text);
					}
				}
			};
		}
	});
}
