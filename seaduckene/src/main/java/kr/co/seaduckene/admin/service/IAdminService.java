package kr.co.seaduckene.admin.service;

import kr.co.seaduckene.admin.command.AdminVO;
import kr.co.seaduckene.common.NoticeVO;

public interface IAdminService {

	// 관리자 정보 가져오기
	AdminVO getAdminVo(AdminVO adminVO);
	
	// 공지사항 글 쓰기
	void write(NoticeVO noticeVO);
	
}