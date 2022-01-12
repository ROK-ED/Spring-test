package co.yo.prj.reservation.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
