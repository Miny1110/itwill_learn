package com.day11;

public class Test5 {

	public static void main(String[] args) {

		String s1 = "서울, 부산, 대구";
		
		//split: s1에 있는 데이터를 ,로 구분해서 배열 안에 넣어라. String의 메소드
		String ss[] = s1.split(",");
		
		for(String s : ss) {
			System.out.print(s + " ");
		}
		
		System.out.println();
		
		String s2 = "seoul";
		String s3 = "Seoul";
		System.out.println(s2==s3); //false
		System.out.println(s2.equals(s3)); //false
		//equalsIgnoreCase: 대소문자 가리지 않고 비교해라
		System.out.println(s2.equalsIgnoreCase(s3)); //true
		
		
		//String은 내부적으로 인덱스가 만들어진다.
		String s4 = "abc.def.hij";
		//index :    01234567890
  		
		//.의 위치 출력(인덱스값 출력)
		System.out.println(s4.indexOf(".")); //3
		//뒤에서부터 만나는 .위 위치 출력
		System.out.println(s4.lastIndexOf(".")); //7
		System.out.println(s4.indexOf("def")); //4
		System.out.println(s4.indexOf("x")); //-1(데이터가 없으면 -1 출력)
		
		
		String s5 = "우리나라 대한민국 좋은나라 대한민국";
		String s6 = s5.replaceAll("대한", "大韓");
		System.out.println(s6);
		
		
		String s7 = "  a  b  c  ";
		System.out.println(s7);
		//trim: 공백 삭제
		System.out.println(s7.trim());
		//공백을 찾아서 null로 바꿔라. (" ":공백 을 "": null로)
		System.out.println(s7.replaceAll(" ", ""));
		//공백을 찾아서 null로 바꿔라. (정규화표현식)
		System.out.println(s7.replaceAll("\\s", ""));
		
		
		char ch = "abcdefg".charAt(2);
		System.out.println(ch);	//c
		
		
		//"abc"로 시작하는가?
		System.out.println("abcdefg".startsWith("abc")); //true
		System.out.println("자바프로그램".startsWith("자바"));
		
		
		System.out.println("abcdefg".length()); //7
		
		
		String s8 = "abcdefg";
		String s9 = "abcdffg";
		//사전식 정렬: ASCII값으로 정렬. ASCII 코드값의 차이
		System.out.println(s8.compareTo(s9)); //-1
		System.out.println(s9.compareTo(s8)); //1
		
	}

}
