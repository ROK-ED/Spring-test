package co.yo.prj.reservation.service;

import java.util.List;

public interface ReservationMapper {
	List<ReservationVO> reservationList();
	
	int reservationInsert(ReservationVO vo);
}