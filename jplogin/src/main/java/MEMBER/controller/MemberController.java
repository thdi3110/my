package MEMBER.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.AlternativeJdkIdGenerator;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import MEMBER.domain.MemberVO;
import MEMBER.service.MemberService;

@Controller
public class MemberController {
	
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value="/MEMBER/main")
	public String main() {
		return "/MEMBER/main";
	}
	
	@RequestMapping(value="/MEMBER/agreement")
	public String agreement() {
		return "/MEMBER/agreement";
	}
	
	@RequestMapping(value="/MEMBER/selectMember", method=RequestMethod.POST)
	public String selectMember(@RequestParam(value="agree", defaultValue = "false")Boolean agree) {
		if(!agree) {			
			return "/MEMBER/agreement";
		}
		return "/MEMBER/selectMember";
	}
	
	@RequestMapping(value="/MEMBER/writeNormal", method=RequestMethod.GET)
	public String writeNormal(Model model) {
		model.addAttribute("memberVO", new MemberVO());
		return "MEMBER/writeNormal";
	}
	
	@RequestMapping(value="/MEMBER/writeNormal", method=RequestMethod.POST)
	public String writeNormal(@Valid MemberVO memberVO, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "/MEMBER/writeNormal";
		}	
		memberVO.getPassword();
		memberService.writeNormal(memberVO);
		return "redirect:/MEMBER/main";
	}
	
	@RequestMapping(value="/MEMBER/writeParcelOut", method=RequestMethod.GET)
	public String writeParcelOut(Model model) {
		model.addAttribute("memberVO", new MemberVO());
		return "MEMBER/writeParcelOut";
	}
	
	@RequestMapping(value="/MEMBER/writeParcelOut", method=RequestMethod.POST)
	public String writeParcelOut(@Valid MemberVO memberVO, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "/MEMBER/writeParcelOut";
		}		
		memberService.writeParcelOut(memberVO);
		return "redirect:/MEMBER/main";
	}
	
	@RequestMapping(value = "/MEMBER/idCheck.do", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String userId = (String) request.getParameter("id");		
		int result = memberService.idCheck(userId);
		return Integer.toString(result);
	}
}
