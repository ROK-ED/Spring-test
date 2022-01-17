package co.yo.prj.hotel.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yo.prj.hotel.service.HotelMapper;
import co.yo.prj.hotel.service.HotelService;
import co.yo.prj.hotel.service.HotelVO;

@Repository("hotelDao")
public class HotelServiceImpl implements HotelService {

	@Autowired
	private HotelMapper map;
	@Override
	public List<HotelVO> HotelSelectList() {
		// TODO Auto-generated method stub
		return map.HotelSelectList();
	}

	@Override
	public HotelVO HotelSelect(HotelVO hotel) {
		// TODO Auto-generated method stub
		return map.HotelSelect(hotel);
	}

	@Override
	public int HotelInsert(HotelVO hotel) {
		// TODO Auto-generated method stub
		return map.HotelInsert(hotel);
	}

	@Override
	public int HotelUpdate(HotelVO hotel) {
		// TODO Auto-generated method stub
		return map.HotelUpdate(hotel);
	}





	@Override
	public int HotelDelete(int hotel_id) {
		// TODO Auto-generated method stub
		return map.HotelDelete(hotel_id);
	}

	@Override
	public List<String> HotelResSearch(String resName, String resDate) {
		// TODO Auto-generated method stub
		return map.HotelResSearch(resName, resDate);
	}

	@Override
	public List<String> HotelBlock(String id) {
		// TODO Auto-generated method stub
		return map.HotelBlock(id);
	}

	@Override
	public List<String> HotelRestrue(String id) {
		// TODO Auto-generated method stub
		return map.HotelRestrue(id);
	}

	@Override
	public int HotelInsertt(HotelVO hotel) { //공공데이터 인서트용 사용x
		// TODO Auto-generated method stub
		return map.HotelInsertt(hotel);
	}

}
