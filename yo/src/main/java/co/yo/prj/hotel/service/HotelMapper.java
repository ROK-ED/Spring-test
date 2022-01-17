package co.yo.prj.hotel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface HotelMapper {
	List<HotelVO> HotelSelectList();
	HotelVO HotelSelect(HotelVO hotel);
	int HotelInsert(HotelVO hotel);
	int HotelUpdate(HotelVO hotel);
	int HotelDelete(int hotel_id);
	
	int HotelInsertt(HotelVO hotel);//공공데이터 인서트용 사용x
	
	List<String> HotelResSearch(@Param("resName")String resName,@Param("resDate")String resDate);
	List<String> HotelBlock(String id);
	List<String> HotelRestrue(String id);
}
