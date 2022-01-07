package co.yo.prj.hotel.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.yo.prj.hotel.service.HotelService;
import co.yo.prj.hotel.service.HotelVO;

@Controller
public class HotelController {

	@Autowired
	private HotelService hotelDao;
	
	@RequestMapping("/hotelSelectList.do")
	public String hotelSelectList(Model model)
	{
		model.addAttribute("hotels",hotelDao.HotelSelectList());
		return "hotel/hotelSelectList";
	}
	
	@RequestMapping("/hotelSelect.do")
	public String hotelSelct(@RequestParam("hotel_id") String id,Model model)
	{
		HotelVO vo=new HotelVO();
		vo.setHotel_id(Integer.parseInt(id));
		model.addAttribute("hotel",hotelDao.HotelSelect(vo));
		return "hotel/hotelSelect";
	}
	@RequestMapping("/hotelInsertForm.do")
	public String hotelInsert(HotelVO hotel)
	{
		
		return "hotel/hotelInsertForm";
	}
	
	@RequestMapping("/hotelResForm.do")
	public String hotelRes(@RequestParam("hotel_id") String id,Model model)
	{
		HotelVO vo=new HotelVO();
		vo.setHotel_id(Integer.parseInt(id));
		model.addAttribute("hotel",hotelDao.HotelSelect(vo));
		return "hotel/hotelResForm";
	}
	@RequestMapping("/hotelUpadteForm.do")
	public String hotelUpadte(@RequestParam("hotel_id") String id,Model model)
	{
		HotelVO vo=new HotelVO();
		vo.setHotel_id(Integer.parseInt(id));
		model.addAttribute("hotel",hotelDao.HotelSelect(vo));
		return "hotel/hotelUpadteForm";
	}
}
