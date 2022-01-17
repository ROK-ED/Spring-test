package co.yo.prj.reservation.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.yo.prj.Message;
import co.yo.prj.reservation.service.ReservationService;
import co.yo.prj.reservation.service.ReservationVO;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService reservationDao;

	@RequestMapping("reservation.do")
	public String reservation(HttpSession session, Model model) {
		// session이 있는지 확인하고 화면을 열고, 권한을 조회해서 권한에 맞는 리스트를 출력한다.

		String member_email = (String) session.getAttribute("member_email");
		String member_author = (String) session.getAttribute("member_author");

		ReservationVO reservation = new ReservationVO();
		reservation.setReservation_member_email(member_email);
		reservation.setReservation_host(member_author);

		if (member_email != null) {
			if (("ADMIN").equals(member_author)) {
				System.out.println("ADMIN 실행");
				model.addAttribute("reservationList", reservationDao.reservationList());
			} else if (("HOST").equals(member_author)) {
				System.out.println("HOST 실행");
				model.addAttribute("reservationList", reservationDao.reservationHostSelect(reservation));
			} else if (("USER").equals(member_author)) {
				System.out.println("USER 실행");
				model.addAttribute("reservationList", reservationDao.reservationUserSelect(reservation));
			}
			return "reservation/reservation";
		} else {
			return "member/memberLoginForm";
		}

	}

	@RequestMapping("chaingeReservation.do")
	public void chaingeReservation(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Model model) throws Exception {
		String cmd = request.getParameter("cmd");
		String strRid = request.getParameter("reservation_id");
		System.out.println("reservation_id : " + strRid);

		ReservationVO vo = new ReservationVO();
		vo.setReservation_id(Integer.parseInt(strRid));

		if (("stand").equals(cmd)) {
			vo.setReservation_state("예약대기");
			reservationDao.reservationInsert(vo);
		} else if (("cancel").equals(cmd)) {
			vo.setReservation_state("예약취소");
			reservationDao.reservationInsert(vo);
		} else if (("success").equals(cmd)) {
			vo.setReservation_state("예약성공");
			reservationDao.reservationInsert(vo);
		}
		request.getRequestDispatcher("reservation.do").forward(request, response);

	}

	@RequestMapping(value = "hotelResInsert.do", produces = "text/plain; charset=UTF-8")
	ModelAndView hotelJoin(@RequestParam("reservation_date1") String da, ReservationVO vo, ModelAndView mav,
			HttpSession session) {
		try {
			SimpleDateFormat transFormat = new SimpleDateFormat("yymmdd");
			Date to = transFormat.parse(da);
			vo.setReservation_date(to);
			reservationDao.HoteReslInsert(vo);
			mav.addObject("data", new Message("예약 되었습니다.", "hotelSelectList.do"));
			mav.setViewName("Message");

		} catch (Exception e) {// 이거쓸일 없음
			e.printStackTrace();
			mav.addObject("data", new Message("예약에 실패하였습니다.", "hotelSelectList.do"));
			mav.setViewName("Message");
		}
		return mav;

	}

	// 장소등록
	@PostMapping(value = "ajaxInsert.do", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String ajaxInsert(double testx, double testy, String testtitle, String testemail, String member_author, ReservationVO vo,
			String print, HttpSession session, Model model) {
		System.out.println("여기 들어오냐?????????");
		System.out.println(member_author);
		System.out.println(testx);
		System.out.println(testy);
		System.out.println(testtitle);
		System.out.println(testemail);
		
		
		
		
		if (testemail == null) {

			print = "로그인이 필요합니다";
			
			return print;

		}
		if (member_author.equals("HOST")) {
			
			print = "일반 유저만 예약이 가능합니다.";

			return print;
		}
		
		if (testtitle == null) {

			print = "원하는 곳의 마커를 클릭해주세요.";
			
			return print;

		}
		
		if (testtitle.equals("")) {

			print = "원하는 곳의 마커를 클릭해주세요.";
			
			return print;

		}
		
		vo.setReservation_member_email(testemail);
		vo.setPlace_name(testtitle);
		try {
			reservationDao.PlaceReslInsert(vo);
			print = "추가 되었습니다.";
			System.out.println(print);

			// 추가후 세션값도 변경
			session.setAttribute("member_x", testx);
			session.setAttribute("member_y", testy);

		} catch (Exception e) {
			print = "추가에 실패 하였습니다.";
			System.out.println(print);
		}
		return print;
	}

	// 멤버리스트에서 각 예약내역보기
	@RequestMapping("memberReservation.do")
	public String memberReservation(String member_email, String member_author, Model model) {
		System.out.println(member_email);
		System.out.println(member_author);
		
		ReservationVO reservation = new ReservationVO();
		reservation.setReservation_member_email(member_email);
		reservation.setReservation_host(member_author);

		if (member_email != null) {
			if (("ADMIN").equals(member_author)) {
				System.out.println("ADMIN 실행");
				model.addAttribute("reservationList", reservationDao.reservationList());
			} else if (("HOST").equals(member_author)) {
				System.out.println("HOST 실행");
				model.addAttribute("reservationList", reservationDao.reservationHostSelect(reservation));
			} else if (("USER").equals(member_author)) {
				System.out.println("USER 실행");
				model.addAttribute("reservationList", reservationDao.reservationUserSelect(reservation));
			}
			return "reservation/reservation";
		} else {
			return "member/memberSelectList";
		}
	}

	@RequestMapping(value = "foodResInsert.do", produces = "text/plain; charset=UTF-8")
	ModelAndView foodResInsert(@RequestParam("reservation_date1") String da, ReservationVO vo, ModelAndView mav,
			HttpSession session, int reservation_food_id, String reservation_food_name) {
		try {
			SimpleDateFormat transFormat = new SimpleDateFormat("yymmdd");
			Date to = transFormat.parse(da);
			vo.setReservation_date(to);
			vo.setReservation_food_id(reservation_food_id);

			//reservation_food_location = reservation_food_location.substring(6, 9);

			vo.setFood_name(reservation_food_name);
			
			reservationDao.FoodReslInsert(vo);
			mav.addObject("data", new Message("예약 되었습니다.", "ajaxFoodList.do"));
			mav.setViewName("Message");

		} catch (Exception e) {// 이거쓸일 없음
			e.printStackTrace();
			mav.addObject("data", new Message("예약에 실패하였습니다.", "ajaxFoodList.do"));
			mav.setViewName("Message");
		}
		return mav;

	}
}
