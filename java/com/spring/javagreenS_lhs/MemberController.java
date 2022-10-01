package com.spring.javagreenS_lhs;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS_lhs.service.MemberService;
import com.spring.javagreenS_lhs.vo.MailVO;
import com.spring.javagreenS_lhs.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService memberService; 
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	JavaMailSender mailSender;
	
	@RequestMapping(value="/login",method=RequestMethod.GET )
	public String loginGet(HttpServletRequest request) {
	// 로그인폼 호출시 기존에 저장된 쿠키가 있다면 불러와서 mid에 담아서 넘겨준다.
			Cookie[] cookies = request.getCookies();
			String mid = "";
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cMid")) {
					mid = cookies[i].getValue();
					request.setAttribute("mid", mid);
					break;
				}
			}
			
			return "member/login";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST )
	public String loginPost(
			Model model,
			// RedirectAttributes redirect,
			HttpServletRequest request, HttpServletResponse response,
			String mid,
			String pwd,
			@RequestParam(name="idCheck", defaultValue = "", required = false) String idCheck,
			HttpSession session
			) {
		MemberVO vo = memberService.getMemIdCheck(mid);
		
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd()) && vo.getUserDel().equals("NO")) {
			System.out.println("vo1:"+vo);
			// 회원 인증처리된경우에 수행할 내용들을 기술한다.(session에 저장할자료 처리, 쿠키값처리...)
			String strLevel = "";
			if(vo.getLevel() == 0) strLevel = "운영자";
			else if(vo.getLevel() == 1) strLevel = "준회원";
			else if(vo.getLevel() == 2) strLevel = "정회원";
			else if(vo.getLevel() == 3) strLevel = "우수회원";
			session.setAttribute("sMid", mid);
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("sStrLevel", strLevel);
			session.setAttribute("sPhoto",vo.getPhoto());
			
			//session.setAttribute("sLastDate", vo.getLastDate());
			
			if(idCheck.equals("on")) {
				Cookie cookie = new Cookie("cMid", mid);
				cookie.setMaxAge(60*60*24*7);		// 쿠키의 만료시간을 7일로 정함(단위:초)
				response.addCookie(cookie);
			}
			else {
				Cookie[] cookies = request.getCookies();
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);		// 기존에 저장된 현재 mid값을 삭제한다.
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
			
		// 방문횟수(오늘방문횟수) 누적하기(최종 접속일/방문포인트 처리) - service객체에서 처리하자....
					memberService.setMemberVisitProcess(vo);
					model.addAttribute("mid", mid);
					//redirect.addAttribute("mid", mid);	// RedirectAttributes객체가 선언된 상태에서 model로 값을 넘길때는 값이 넘어가지 않는다.
					return "redirect:/msg/memLoginOk";
				}
				else {
					System.out.println("vo2:"+vo);
					return "redirect:/msg/memLoginNo";
				}
			}
	
	@RequestMapping(value="/logOut",method=RequestMethod.GET )
	public String logOutGet(HttpSession session) {
		session.invalidate();
		
		return "redirect:/home";
	}
	
	@RequestMapping(value="/signup",method=RequestMethod.GET )
	public String signupGet() {
		return "member/signup";
	}
	@RequestMapping(value="/signup",method=RequestMethod.POST )
	public String signupPost(MemberVO vo,MultipartFile fName) {
		
		if(memberService.getMemIdCheck(vo.getMid()) != null) {
			return "redirect:/msg/memIdCheckNo";
		}
		// 비밀번호 암호화 처리
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		// 체크 완료된 자료를 다시 vo에 담았다면 DB에 저장시켜준다.(회원 가입처리)
		int res = memberService.setMemInputOk(fName, vo);
		
		if(res == 1) return "redirect:/msg/signupOk";
		else return "redirect:/msg/signupNo";
	}
	@ResponseBody
	@RequestMapping(value="/signupIdCheck",method=RequestMethod.POST )
	public String signupIdCheckPost(String mid) {
		String res = "0";
		MemberVO vo = memberService.getMemIdCheck(mid);
		if(vo != null) res = "1";
		
		return res;
	}
	
	@RequestMapping(value="/signup_child",method=RequestMethod.GET )
	public String signup_childGet() {
		return "member/signup_child";
	}
	@RequestMapping(value="/myPage",method=RequestMethod.GET )
	public String myPageGet(HttpSession session,Model model,MemberVO vo) {
		String mid = (String) session.getAttribute("sMid");
		vo = memberService.getMemIdCheck(mid);
		model.addAttribute("vo",vo);
		return "member/myPage";
	}
	@RequestMapping(value="/memCheck",method=RequestMethod.GET )
	public String memCheckGet() {
		return "member/memCheck";
	}
	@RequestMapping(value="/memCheck",method=RequestMethod.POST )
	public String memberUpdatePost(HttpSession session,Model model,MemberVO vo,String pwd) {
		String mid = (String) session.getAttribute("sMid");
		vo = memberService.getMemIdCheck(mid);
		if(passwordEncoder.matches(pwd, vo.getPwd())) {
			model.addAttribute("vo",vo);
			return "member/memberUpdate";
		}		
		else {
			return "redirect:/msg/memCheckNo";
		}
	}
	@RequestMapping(value="/memberUpdate",method=RequestMethod.POST )
	public String memberUpdatePost(MemberVO vo,MultipartFile fName) {
		System.out.println("vo.pwd:"+vo.getPwd());
		if(!vo.getPwd().equals("")) {
			vo.setPwd(passwordEncoder.encode(vo.getPwd()));
			memberService.memberUpdate(vo,fName);
		}
		else if(vo.getPwd().equals("") && vo.getPwd() == null) {
			memberService.memberUpdate2(vo);
		}
		return "redirect:/msg/memberUpdateOk";
	}
	
	@RequestMapping(value="/memDelete",method=RequestMethod.GET )
	public String memDeleteGet() {
		return "member/memDelete";
	}
	@RequestMapping(value="/memDelete",method=RequestMethod.POST )
	public String memDeletePost(MailVO vo,String pwd,MemberVO vo2,HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		vo2 = memberService.getMemIdCheck(mid);
		
		if(passwordEncoder.matches(pwd, vo2.getPwd())) {
			try {
				String toMail = vo.getEmail();
				String title = vo.getTitle();
				String content = vo.getContent();
				
				// 메세지를 변환시켜서 보관함(messageHelper)에 저장하여 준비한다.
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				// 메일보관함에 회원이 보낸온 메세지를 모두 저장시켜둔다.
				messageHelper.setTo(toMail);
				messageHelper.setSubject(title);
				messageHelper.setText(content);
				
				content += "<a href='http://192.168.50.108:9090/javagreenS_lhs/member/memDeleteOk?mid="+mid+"'>예</a>";
				messageHelper.setText(content, true);
				
				
				// 메일 전송하기
				mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			return "redirect:/msg/mailSendOk";
			}
		else {
			return "redirect:/msg/mailSendNo";
		}
	}
	
	@RequestMapping(value="/memDeleteOk",method=RequestMethod.GET )
	public String memDeleteOkGet(String mid,HttpSession session) {
		session.setAttribute("sMid", mid);
		
		
		return "member/memDeleteOk";
	}
	@RequestMapping(value="/memDeleteOk",method=RequestMethod.POST )
	public String memDeleteOkPost(HttpSession session,MemberVO vo,Model model) {
		String mid = (String) session.getAttribute("sMid");
		vo = memberService.getMemIdCheck(mid);
		memberService.memDeleteOk(mid);
		model.addAttribute("name",vo.getName());
		session.invalidate();
		return "redirect:/msg/memDeleteOk";
	}
}
