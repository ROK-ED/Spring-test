package co.yo.prj.hotel.service;

import java.util.List;

public interface HotelService {
	List<HotelVO> HotelSelectList();
	HotelVO HotelSelect(HotelVO hotel);
	int HotelInsert(HotelVO hotel);
	int HotelUpdate(HotelVO hotel);
	int HotelDelete(int hotel_id);
	
	int HotelInsertt(HotelVO hotel);//공공데이터 인서트용 사용x
	
	
	List<String> HotelResSearch(String resName,String resDate);
	List<String> HotelBlock(String id);
	List<String> HotelRestrue(String id);
}
