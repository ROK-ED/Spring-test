package co.yo.prj.hotel.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yo.prj.hotel.service.HotelService;
import co.yo.prj.hotel.service.HotelVO;

@Controller
public class HotelController {

	@Autowired
	private HotelService hotelDao;
	
	@RequestMapping("/hotelSelectList.do")
	public String hotelSelectList(Model model)
	{
		//model.addAttribute("hotels",hotelDao.HotelSelectList());
		return "hotel/hotelSelectList";
	}
	
	@RequestMapping("/hotelSelect.do")
	public String hotelSelct(Model model)
	{
		return "hotel/hotelSelect";
	}
	@RequestMapping("/hotelInsert.do")
	public String hotelInsert(HotelVO hotel)
	{
		
		return "hotel/hotelInsert";
	}
	
}
