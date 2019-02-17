package com.kh.tsp.common.Logger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Component
@Aspect
public class Advice {
	private Logger logger = LoggerFactory.getLogger(Advice.class);
	
	@Pointcut("execution(* com.kh.tsp..*.*(..))")
	public void allPointcut() {
		
	}
	
	@Around("allPointcut()")
	public Object preAdvice(ProceedingJoinPoint pj) throws Throwable {
		logger.info("------------------------- 메소드 명 : " + pj.getSignature().getName() + "-------------------------");
		// 사전, 사후 처리를 모두 해결하려고 할 때 사용하는 어드바이스이다.
		
		// 사전에 대한 처리할 내용
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		// 다시 원래 흐름대로 진행
		Object obj;
		
		obj = pj.proceed();
		
		// 사후에 대한 처리할 내용
		stopWatch.stop();
		
		logger.info(pj.getSignature().getName() + "메소드 수행에 걸린 시간 : " + stopWatch.getTotalTimeMillis() + "(ms)초");
		logger.info("------------------------------------------------------------------------------------");
		return obj;
	}
}
