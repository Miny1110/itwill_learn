package com.day20;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

//replaceAll

public class Test2 {

	public static String replaceAll(String str, String oldStr, String newStr) {
		
		if(str==null) {
			return null;
		}
		
		//str 문장에서 oldStr 문자를 찾아라
		Pattern p = Pattern.compile(oldStr);
		Matcher m = p.matcher(str);

		//문장을 넣을거기 때문에 Buffer가 아니라 StringBuffer로 받는다.
		//String은 쓰레기값을 많이 만들기 때문에 이를 해결하기 위해서 StringBuffer를 사용한다.
		StringBuffer sb = new StringBuffer();
		
		while(m.find()) {
			m.appendReplacement(sb, newStr);
		}
		
		//마지막으로 찾은 문자 뒤에 있는 문장도 보여라. 이거 안하면 마지막 문자 뒤쪽은 짤린다.
		m.appendTail(sb);
		
		return sb.toString();
	}
	
	
	
	public static void main(String[] args) {

		String str = "우리나라 대한민국 대한독립 대한의 건아...";
		
		String s = Test2.replaceAll(str, "대한", "大韓");
		
		System.out.println(s);
		
	}

}
