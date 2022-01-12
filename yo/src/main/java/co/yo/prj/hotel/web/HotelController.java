package co.yo.prj.hotel.web;


import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import co.yo.prj.Message;
import co.yo.prj.hotel.service.HotelService;
import co.yo.prj.hotel.service.HotelVO;


@Controller
public class HotelController {

	@Autowired
	private HotelService hotelDao;
	
	
	@RequestMapping("/hotelSelectList.do")//호텔리스트
	public String hotelSelectList(Model model)
	{
		model.addAttribute("hotels",hotelDao.HotelSelectList());
		return "hotel/hotelSelectList";
	}
	
	@RequestMapping("/hotelSelect.do")//호텔 상세조회
	public String hotelSelct(@RequestParam("hotel_id") String id,Model model)
	{
		HotelVO vo=new HotelVO();
		vo.setHotel_id(Integer.parseInt(id));
		model.addAttribute("hotel",hotelDao.HotelSelect(vo));
		return "hotel/hotelSelect";
	}
	@RequestMapping("/hotelInsertForm.do")//호텔 등록폼
	public String hotelInsert(HotelVO hotel)
	{
		
		return "hotel/hotelInsertForm";
	}
	
	@RequestMapping("/hotelResForm.do")//호텔 예약폼
	public String hotelRes(@RequestParam("hotel_id") String id,Model model,HttpSession session)
	{
		
		HotelVO vo=new HotelVO();
		vo.setHotel_id(Integer.parseInt(id));
		model.addAttribute("hotel",hotelDao.HotelSelect(vo));
		
		model.addAttribute("block",hotelDao.HotelBlock(id));
		return  "hotel/hotelResForm";
	}
	
	@RequestMapping("/hotelUpadteForm.do")//호텔 수정폼
	public String hotelUpadte(@RequestParam("hotel_id") String id,Model model)
	{
		HotelVO vo=new HotelVO();
		vo.setHotel_id(Integer.parseInt(id));
		model.addAttribute("hotel",hotelDao.HotelSelect(vo));
		return "hotel/hotelUpadteForm";
	}
	
	
	
	@PostMapping("hotelInsert.do")//호텔등록
	ModelAndView hotelJoin(@RequestParam("thumbnail") MultipartFile thu,@RequestParam("picture") MultipartFile pic ,HotelVO hotel, ModelAndView mav, HttpSession session) {
		try {
			String oriThuName=thu.getOriginalFilename();
			String oriPicName=pic.getOriginalFilename();
			
			if(!oriThuName.isEmpty())
			{
				String tuuid=UUID.randomUUID().toString();
				String savThuName=tuuid+oriThuName.substring(oriThuName.lastIndexOf("."));
				thu.transferTo(new File("C:/Users/admin/git/Spring-test/yo/src/main/webapp/resources/img",savThuName));//admin 이름 변경필요
				hotel.setHotel_thumbnail(oriThuName);
				hotel.setHotel_tfile(savThuName);
			}
			if(!oriPicName.isEmpty())
			{
				String puuid=UUID.randomUUID().toString();
				String savPicName=puuid+oriPicName.substring(oriPicName.lastIndexOf("."));
				pic.transferTo(new File("C:/Users/admin/git/Spring-test/yo/src/main/webapp/resources/img",savPicName));
				hotel.setHotel_picture(oriPicName);
				hotel.setHotel_pfile(savPicName);
			}
		
			hotelDao.HotelInsert(hotel);
			mav.addObject("data", new Message("등록 되었습니다.", "hotelSelectList.do"));
			mav.setViewName("Message");

		} catch (Exception e) {// 이거쓸일 없음
			e.printStackTrace();
			mav.addObject("data", new Message("등록에 실패하였습니다.", "hotelSelectList.do"));
			mav.setViewName("Message");
		}
		return mav;

	}
	
	
	
	
	
	@PostMapping("hotelDelete.do")//호텔삭제
	ModelAndView memberJoin(@RequestParam("hotel_id") int id , ModelAndView mav, HttpSession session) {
		try {
			hotelDao.HotelDelete(id);
			hotelDao.HotelIdUpdate(id);
			mav.addObject("data", new Message("삭제 되었습니다.", "hotelSelectList.do"));
			mav.setViewName("Message");

		} catch (Exception e) {// 이거쓸일 없음
			e.printStackTrace();
			mav.addObject("data", new Message("예약중인 회원이 있습니다.", "hotelSelectList.do"));
			mav.setViewName("Message");
		}
		return mav;
	}
	
	@PostMapping("hotelUpdate.do")//호텔등록
	ModelAndView hotelUpdate(HotelVO hotel, ModelAndView mav, HttpSession session) {
		try {
			hotelDao.HotelUpdate(hotel);
			mav.addObject("data", new Message("수정 되었습니다.", "hotelSelectList.do"));
			mav.setViewName("Message");

		} catch (Exception e) {// 이거쓸일 없음
			e.printStackTrace();
			mav.addObject("data", new Message("수정에 실패하였습니다.", "hotelSelectList.do"));
			mav.setViewName("Message");
		}
		return mav;

	}
	@RequestMapping("hotelResSearch.do")//조건 검색
	public String hotelResSearch(@RequestParam("resName") String resName,@RequestParam("resDate") String resDate,Model model)
	{
		
		List<HotelVO> hotels = new ArrayList<HotelVO>();
		List<String>id=hotelDao.HotelResSearch(resName, resDate);

		for(String str : id)
		{
			HotelVO vo=new HotelVO();
			vo.setHotel_id(Integer.parseInt(str));
			hotels.add(hotelDao.HotelSelect(vo));
		}
		model.addAttribute("hotels",hotels);
		return "hotel/hotelSelectList";
	}
		
	
}
