package co.yo.prj.hotel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface HotelMapper {
	List<HotelVO> HotelSelectList();
	HotelVO HotelSelect(HotelVO hotel);
	int HotelInsert(HotelVO hotel);
	int HotelUpdate(HotelVO hotel);
	int HotelDelete(int hotel_id);
	
	int HotelIdUpdate(int hotel_id);
	
	List<String> HotelResSearch(@Param("resName")String resName,@Param("resDate")String resDate);
	List<String> HotelBlock(String id);
}
