package co.yo.prj.board.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private int board_id;
	private String board_title;
	private String board_content;
	private Date board_date;
	private Date board_date_re;
	private String member_email;
}
