package co.yo.prj.reservation.service;

import java.util.List;

public interface ReservationMapper {
	List<ReservationVO> reservationList();
	List<ReservationVO> reservationUserSelect(ReservationVO vo);
	List<ReservationVO> reservationHostSelect(ReservationVO vo);
	int reservationInsert(ReservationVO vo);
	int HoteReslInsert(ReservationVO vo);
	int PlaceReslInsert(ReservationVO vo);
}