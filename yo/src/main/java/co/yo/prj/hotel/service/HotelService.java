package co.yo.prj.hotel.service;

import java.util.List;

public interface HotelService {
	List<HotelVO> HotelSelectList();
	HotelVO HotelSelect(HotelVO hotel);
	int HotelInsert(HotelVO hotel);
	int HotelUpdate(HotelVO hotel);
	int HotelDelete(HotelVO hotel);
	
}
