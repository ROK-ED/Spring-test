package co.yo.prj.reservation.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yo.prj.reservation.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService reservationDao;

	@RequestMapping("reservation.do")
	public String reservation(Model model) {
		model.addAttribute("reservationList", reservationDao.ReservationList());
		return "reservation/reservation";
	}

	@RequestMapping("chaingeReservation.do")
	public String chaingeReservation(HttpServletRequest request, HttpSession session, Model model) {
		request.getParameter("reservation_state");
		

		return "";
	}
}
