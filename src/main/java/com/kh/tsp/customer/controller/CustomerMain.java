package com.kh.tsp.customer.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.tsp.customer.model.service.CustomerMainService;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Parking;
import com.kh.tsp.customer.model.vo.Points;

@SessionAttributes("loginUser")
@Controller
public class CustomerMain {
	
	
	@Autowired
	private CustomerMainService cms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	public CustomerMain() {
		
	}
	

	@RequestMapping(value="/customer.cu")
	public String Customer() {
		
		return "customer/main/Customer_main";
	}
	
	
	//로그인 메소드
	@RequestMapping(value="allLogin.cu",method=RequestMethod.POST)
	public String allLogin(@ModelAttribute Member m,Model model) {
		//System.out.println("컨트롤러: "+m);
		
		try {
			Member loginUser = cms.selectCheckMember(m);
			
			//System.out.println("컨트롤러: "+loginUser);
			
			model.addAttribute("loginUser", loginUser);
			
			if(loginUser.getMember_type().equals("U") || loginUser.getMember_type().equals("u")) {
				return "redirect:customer.cu";				
			}else if(loginUser.getMember_type().equals("A") || loginUser.getMember_type().equals("a")) {
				return "redirect:statisticsList.ad";	
			}else {
				return "redirect:parkingceoMain.pc";	
			}
		}catch(Exception e) {
			model.addAttribute("message", "로그인실패");
			
			return "common/errorPage";
		}
		
	}
	
	//로그 아웃 메소드
	@RequestMapping(value="customerLogOut.cu", method=RequestMethod.GET)
	public String customerLogOut(SessionStatus status) {
		status.setComplete();
		return "redirect:customer.cu";
	}
	
	//관리자 로그아웃 메소드
	@RequestMapping(value="adminLogout.ad")
	public String adminLogOut(SessionStatus status) {
		status.setComplete();
		return "redirect:customer.cu";
	}
	
	@RequestMapping(value="parkingCeoLogout.pc")
	public String parkingCeoLogOut(SessionStatus status) {
		status.setComplete();
		return "redirect:customer.cu";
	}
	
	/*	//내주변 주차장 정보 가져오기 메소드
	@RequestMapping(value="getnearParkings.cu")
		public ModelAndView getnearParkings(ModelAndView mv) {
			
			ArrayList<Parking> parkings =null;
			
			parkings =cms.getnearParkings();
			
			for(Parking p :parkings) {
				System.out.println(p);
			}
			System.out.println(parkings.size());
		
		
		
			mv.addObject("parkings",parkings);
			mv.setViewName("jsonView");
			
			
			return mv;
		}*/
	
/*//내주변 주차장 정보 가져오기 메소드
	@RequestMapping(value="getnearParkings.cu")
	public void getnearParkings(HttpServletResponse response) {
		
		ObjectMapper mapper = new ObjectMapper();
		
		ArrayList<Parking> parkings =null;
		
		parkings =cms.getnearParkings();
		
		for(Parking p :parkings) {
			System.out.println(p);
		}
		System.out.println(parkings.size());
	
		
		
		try {
			response.getWriter().print(mapper.writeValueAsString(parkings));
			
			
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}*/
	
	
	//4. @ResponseBody를 이용한 ajax
	@RequestMapping(value="getnearParkings.cu")
	public @ResponseBody HashMap<String, Object> getnearParkings(@RequestParam String x0,@RequestParam String x1,@RequestParam String y0,@RequestParam String y1,HttpServletResponse response) {
		
		
		double x00=Double.parseDouble(x0);
		double x01=Double.parseDouble(x1);
		double y00=Double.parseDouble(y0);
		double y01=Double.parseDouble(y1);
		
		
		
		System.out.println(x00+","+x01+","+y00+","+y01);
		ArrayList<Parking> parkings =null;
		
		Points p =new Points(x00,x01,y00,y01);
		
		
		parkings =cms.getnearParkings(p);
		
		System.out.println(parkings.size());
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("parkings", parkings);
		
			return hmap;
		}
	
	//카카오톡 로그인
	@RequestMapping(value="kakao.cu", method=RequestMethod.POST)
	public String kakao(@RequestParam String kakao_id, String member_name, HttpServletResponse response, Model model, Member m) {
		System.out.println("kakao_id: "+kakao_id+"//member_name: "+member_name);
		
		/*Member loginUser = new Member();
		loginUser.setMember_name(name);
		
		model.addAttribute("loginUser", loginUser);
		*/
		
		
		
		Member loginUser = cms.selectCheckKakao(kakao_id);
		if(loginUser == null) {//회원가입
			System.out.println("kakao_id: "+kakao_id+"member_name: "+member_name);
			model.addAttribute("kakao_id", kakao_id);
			model.addAttribute("member_name", member_name);
			
			
			return "customer/main/Customer_kakao_joinInput";
		}else {
			System.out.println("loginUser: "+loginUser);
			model.addAttribute("loginUser", loginUser);
			
			return "redirect:customer.cu";
		}
		
		
		//return "redirect:customer.cu";
		
	}
	//카카오톡 회원가입
	@RequestMapping(value="insertKakao.cu", method=RequestMethod.POST)
	public String insertKakao(@ModelAttribute Member m, Model model) {
		System.out.println(m);
		try {
			cms.insertKakao(m);
		}catch(Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/errorPage";
		}
				
		return "redirect:customer_loginPage.cu";
	}
	
	//아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "/idCheck.cu", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
	 
	 
	 String member_id = req.getParameter("member_id");
	 System.out.println("member_id: "+member_id);
	 
	 Member idCheck =  cms.idCheck(member_id);
	 
	 int result = 0;
	 
	 if(idCheck != null) {
	  result = 1;
	 } 
	 System.out.println("result : "+result);
	 return result;
	}
	
	//일반 회원가입
	@RequestMapping(value="insertMember.cu", method=RequestMethod.POST)
	public String insertMember(@ModelAttribute Member m, Model model) {
		
		System.out.println(m);
		
		String encPassword = passwordEncoder.encode(m.getMember_pwd());
		
		System.out.println("암호화 후: "+encPassword);
		
		m.setMember_pwd(encPassword);
		
		try {
			cms.insertMember(m);
		}catch(Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/errorPage";
		}
		
		return "redirect:customer_loginPage.cu";
	
	}
	
	//아이디/비밀번호 찾기 폼으로 이동
	@RequestMapping(value="findIdPwd.cu")
	public String findPwdForm() {
		return "customer/main/find_IdPwd_form";
	}
	
	

	//아이디찾기
	@ResponseBody
	@RequestMapping(value = "/findId.cu", method = RequestMethod.POST)
	public String findId(HttpServletRequest req) throws Exception {
	 
	 
	 String email = req.getParameter("email");
	 System.out.println("아이디 찾기 email: "+email);
	 
	 Member findId =  cms.findId(email);
	 
	 String result = "";
	 
	 if(findId != null) {
		
		 result = findId.getMember_id();
		 
		 return result;
	
	 }else {
		
		 return result;
	 }
	 
	 
	}
	
	//이메일 중복 확인
		@ResponseBody
		@RequestMapping(value="emailCheck.cu", method = RequestMethod.POST)
		public int emailCheck(HttpServletRequest req) throws Exception{

			 String email = req.getParameter("email");
			 System.out.println("email: "+email);
			 
			 Member emailCheck =  cms.emailCheck(email);
			 
			 //System.out.println(emailCheck);
			 
			 int result = 0;
			 
			 if(emailCheck != null) {
				 result = 1;
			 } 
			 System.out.println("이메일 중복 result : "+result);
			 
			 return result;
		}
	
	//정보 조회(비밀번호 찾기)
	@ResponseBody
	@RequestMapping(value="findPwd.cu", method=RequestMethod.POST)
	public int chkForPwd(@ModelAttribute Member m,Model model) {
		System.out.println("비밀번호 찾기 아이디&이메일: "+m);
		
		Member chk = cms.chkForPwd(m);
		
		int result = 0;
		
		if(chk != null) {
			result = 1;

		}
	
		
		return result;
	}
	
	//임시 비밀번호 등록
	@ResponseBody	
	@RequestMapping(value="setTempPwd.cu", method=RequestMethod.POST)
	public String setTempPwd(@ModelAttribute Member m, HttpServletRequest request) {
		//System.out.println("임시비밀번호로 바꾸기 : "+m);
		
		String tempPwd = request.getParameter("tempPwd");
		String encPassword = passwordEncoder.encode(tempPwd);
			
		//System.out.println("암호화 된 임시 비밀번호 : "+encPassword);
		
		m.setMember_pwd(encPassword);
		
		int result = cms.insertTempPwd(m);
		String alert = "";
		
		//System.out.println("result : "+result);
		
		if(result > 0) {
			
			alert="해당 이메일로 임시비밀번호가 발급되었습니다. 로그인 후 변경해주세요";
		}else {
			alert="임시번호 발급에 실패했습니다.";
		}
		
		return alert;
	}
}