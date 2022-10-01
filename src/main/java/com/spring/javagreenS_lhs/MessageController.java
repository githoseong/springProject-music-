package com.spring.javagreenS_lhs;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {

	@RequestMapping(value="/msg/{msgFlag}", method=RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag, Model model,
			@RequestParam(value="flag", defaultValue = "", required=false) String flag,
			@RequestParam(value="name", defaultValue = "", required=false) String name,
			@RequestParam(value="mid", defaultValue = "", required=false) String mid,
			@RequestParam(value="idx", defaultValue = "0", required=false) int idx) {
		
		if(msgFlag.equals("newUploadOk")) {
			model.addAttribute("msg", "음악 업로드 완료 되었습니다.");
			model.addAttribute("url", "admin/newList");
		}
		else if(msgFlag.equals("newDeleteOk")) {
			model.addAttribute("msg", "삭제가 완료 되었습니다.");
			model.addAttribute("url", "admin/newList");
		}
		else if(msgFlag.equals("newUpdate")) {
			model.addAttribute("msg", "수정이 완료 되었습니다.");
			model.addAttribute("url", "admin/newList");
		}
		else if(msgFlag.equals("bannerUploadOk")) {
			model.addAttribute("msg", "배너 업로드가 완료 되었습니다.");
			model.addAttribute("url", "admin/banner");
		}
		else if(msgFlag.equals("videoUploadOk")) {
			model.addAttribute("msg", "동영상 업로드가 완료 되었습니다.");
			model.addAttribute("url", "admin/admin");
		}
		else if(msgFlag.equals("bannerDeleteOk")) {
			model.addAttribute("msg", "베너 삭제가 완료 되었습니다.");
			model.addAttribute("url", "admin/admin");
		}
		else if(msgFlag.equals("videoUpdateOk")) {
			model.addAttribute("msg", "동영상 수정이 완료 되었습니다.");
			model.addAttribute("url", "video/videoList");
		}
		else if(msgFlag.equals("videoDeleteOk")) {
			model.addAttribute("msg", "동영상이 삭제되었습니다.");
			model.addAttribute("url", "video/videoList");
		}
		else if(msgFlag.equals("magazineUploadOk")) {
			model.addAttribute("msg", "메거진 업로드가 완료 되었습니다.");
			model.addAttribute("url", "magazine/admagazine");
		}
		else if(msgFlag.equals("magazineUpdateOk")) {
			model.addAttribute("msg", "메거진 수정이 완료 되었습니다.");
			model.addAttribute("url", "magazine/admagazine");
		}
		else if(msgFlag.equals("magazineDeleteOk")) {
			model.addAttribute("msg", "메거진이 삭제 되었습니다.");
			model.addAttribute("url", "magazine/admagazine");
		}
		else if(msgFlag.equals("magazineDeleteNo")) {
			model.addAttribute("msg", "댓글을 먼저 삭제 해주세요");
			model.addAttribute("url", "magazine/admagazine");
		}
		else if(msgFlag.equals("memIdCheckNo")) {
			model.addAttribute("msg", "중복된 아이디가 있습니다.");
			model.addAttribute("url", "member/signup");
		}
		else if(msgFlag.equals("signupOk")) {
			model.addAttribute("msg", "회원가입 성공.");
			model.addAttribute("url", "/member/login");
		}
		else if(msgFlag.equals("signupNo")) {
			model.addAttribute("msg", "회원가입 실패.");
			model.addAttribute("url", "member/signup");
		}
		else if(msgFlag.equals("memLoginOk")) {
			model.addAttribute("msg", "로그인 성공.");
			model.addAttribute("url", "/home");
		}
		else if(msgFlag.equals("memLoginNo")) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 틀립니다.");
			model.addAttribute("url", "member/login");
		}
		else if(msgFlag.equals("boardUploadOk")) {
			model.addAttribute("msg", "게시글 업로드가 완료되었습니다.");
			model.addAttribute("url", "board/board"+flag);
		}
		else if(msgFlag.equals("boardUpdateOk")) {
			model.addAttribute("msg", "게시글 수정이 완료되었습니다.");
			model.addAttribute("url", "board/board"+flag);
		}
		else if(msgFlag.equals("boardDeleteOk")) {
			model.addAttribute("msg", "게시글 삭제가 완료되었습니다.");
			model.addAttribute("url", "board/board"+flag);
		}
		else if(msgFlag.equals("memberUpdateOk")) {
			model.addAttribute("msg", "회원 정보가 수정 되었습니다.");
			model.addAttribute("url", "member/myPage");
		}
		else if(msgFlag.equals("memberUpdateNo")) {
			model.addAttribute("msg", "회원 정보가 수정 실패");
			model.addAttribute("url", "member/myPage");
		}
		else if(msgFlag.equals("memCheckNo")) {
			model.addAttribute("msg", "비밀번호가 틀립니다.");
			model.addAttribute("url", "member/myPage");
		}
		else if(msgFlag.equals("mailSendOk")) {
			model.addAttribute("msg", "입력하신 메일로 탈퇴 메시지를 보냈습니다.");
			model.addAttribute("url", "member/myPage");
		}
		else if(msgFlag.equals("mailSendNo")) {
			model.addAttribute("msg", "비밀번호가 틀립니다.");
			model.addAttribute("url", "member/memDelete");
		}
		else if(msgFlag.equals("memDeleteOk")) {
			model.addAttribute("msg","회원 탈퇴 완료. "+name+"님 그동안 peach를 이용해주셔서 감사합니다.");
			model.addAttribute("url", "/home");
		}
		else if(msgFlag.equals("userDelOk")) {
			model.addAttribute("msg","회원 탈퇴 처리 완료.");
			model.addAttribute("url", "admin/memManage");
		}
		else if(msgFlag.equals("searchPwdCheckOk")) {
			model.addAttribute("msg","비밀번호가 변경되었습니다.");
			return "include/pwdMessage";
		}
		else if(msgFlag.equals("askOk")) {
			model.addAttribute("msg","문의를 성공적으로 보냈습니다.");
			model.addAttribute("url","member/myPage");
		}
		else if(msgFlag.equals("askContentDelOk")) {
			model.addAttribute("msg","문의를 삭제했습니다.");
			model.addAttribute("url","member/askList");
		}
		else if(msgFlag.equals("adAskContentDelOk")) {
			model.addAttribute("msg","문의를 삭제했습니다.");
			model.addAttribute("url","admin/ask");
		}
		else if(msgFlag.equals("levelMemberNo")) {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("videoNo")) {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("url","video/video");
		}
		else if(msgFlag.equals("videoNo2")) {
			model.addAttribute("msg","정회원 이상만 이용하실 수 있습니다.");
			model.addAttribute("url","video/video");
		}
		
		return "include/message";
	}
	
}
