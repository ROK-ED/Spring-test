package co.yo.prj.reservation.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yo.prj.reservation.service.ReservationMapper;
import co.yo.prj.reservation.service.ReservationService;
import co.yo.prj.reservation.service.ReservationVO;

@Repository("reservationDao")
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationMapper map;
	
	@Override
	public List<ReservationVO> reservationList() {
		// TODO Auto-generated method stub
		return map.reservationList();
	}

	@Override
	public int reservationInsert(ReservationVO vo) {
		// TODO Auto-generated method stub
		return map.reservationInsert(vo);
	}

}
