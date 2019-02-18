package com.kh.tsp.common.Logger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StopWatch;

public class Advice {
	/*private Logger logger = LoggerFactory.getLogger(Advice.class);
	
	@Pointcut("execution(* com.kh.tsp..*ServiceImpl.*(..))")
	public void allPointcut() {
		
	}*/
	
	/*@Around("allPointcut()")
	public Object preAdvice(ProceedingJoinPoint pj) throws Throwable {
		logger.info("---------------------------------------------------------------------");
		logger.info("클래스 명 : " + pj.getTarget().getClass().getSimpleName());
		logger.info("메소드 명 : " + pj.getSignature().getName());

		logger.info("");
		
		// 사전에 대한 처리할 내용
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		// 다시 원래 흐름대로 진행
		Object obj;
		
		obj = pj.proceed();
		
		// 사후에 대한 처리할 내용
		stopWatch.stop();
		
		logger.info(obj.toString());
		logger.info(pj.getSignature().getName() + "메소드 수행에 걸린 시간 : " + stopWatch.getTotalTimeMillis() + "(ms)초");
		logger.info("---------------------------------------------------------------------");
		return obj;

	}
	
	@AfterReturning(pointcut = "allPointcut()", returning="returnObj") 
	public void afterLog(JoinPoint jp, Object returnObj) {
		// 비지니스 메소드가 리턴한 결과 데이터를 다른 용도로 처리할 때 사용한다.
		String methodName = jp.getSignature().getName();
		
		System.out.println(jp.getSignature().getName() + "메소드의 리턴값 : " + returnObj.toString());

	}*/
}
