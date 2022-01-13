package co.yo.prj.reservation.service;

import java.util.List;

public interface ReservationService {
	List<ReservationVO> reservationList();
	
	int reservationInsert(ReservationVO vo);
	int HoteReslInsert(ReservationVO vo);
}
