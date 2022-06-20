package com.excep;

public class OperationAuthenticator {

	//사용자가 입력한 값을 두개의 수를 ,로 구분해서 입력받기
	
	//두개를 입력했는지 체크
	public void inputFormat(String str) throws AuthenticationException{
		
		//,로 구분
		String[] temp = str.split(",");
		
		//길이가 2가 아니면 (=입력값이 두개가 아니면)
		if(temp.length!=2) {
			throw new AuthenticationException("숫자 입력 형식 오류!!" + str);
		}
		
	}
	
	///노란밑줄(사용하지 않은 변수들) 없애기 위해 추가
	@SuppressWarnings("unused")
	public void number(String str) throws AuthenticationException{
		
		try {
			
			if(str.indexOf(".")!=-1) { //실수
				double num = Double.parseDouble(str);
			}else {
				int num = Integer.parseInt(str);
			}
			
		} catch (NumberFormatException e) {

			throw new AuthenticationException("숫자 변환 불가: " + str);
			
		}
		
	}
	
	
	
	public void operator(char ch) throws AuthenticationException{
		
		switch(ch) {
		//+-*/이면 stop
		//break;가 없어서 +부터 /까지 쭉 적용된다.
		case '+':	case '-':	case '*':	case '/':
			return;
	
		default:
			throw new AuthenticationException("연산자 오류: " + ch);
		}
		
		
		
		
	}
	
	
	
	
	
	
}
