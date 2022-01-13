package co.yo.prj.reservation.web;


import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		String member_email = (String) session.getAttribute("member_email");
		if (member_email != null) {
			model.addAttribute("reservationList", reservationDao.reservationList());
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
	ModelAndView hotelJoin(@RequestParam("reservation_date1") String da,ReservationVO vo, ModelAndView mav, HttpSession session) {
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
}
