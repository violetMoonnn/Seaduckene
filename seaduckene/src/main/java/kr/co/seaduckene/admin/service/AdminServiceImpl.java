package kr.co.seaduckene.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.admin.command.AdminSearchVO;
import kr.co.seaduckene.admin.command.AdminVO;
import kr.co.seaduckene.admin.command.AskListVO;
import kr.co.seaduckene.admin.mapper.IAdminMapper;
import kr.co.seaduckene.common.NoticeVO;
import kr.co.seaduckene.product.command.ProductVO;
import kr.co.seaduckene.util.AskCategoryBoardVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminServiceImpl implements IAdminService {
	
	@Autowired
	private IAdminMapper adminMapper;
	
	@Override
	public AdminVO getAdminVo(AdminVO adminVO) {
		log.info(adminVO);
		return adminMapper.getAdminVo(adminVO);
	}
	
	@Override
	public void write(NoticeVO noticeVO) {
		adminMapper.write(noticeVO);
	}
	
	@Override
	public List<AdminSearchVO> usersSearch(String type, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		return adminMapper.usersSearch(map);
	}

	@Override
	public void insertInvoice(String invoiceNum, String orderNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("invoiceNum", invoiceNum);
		map.put("orderNum", orderNum);
		adminMapper.insertInvoice(map);;
	}
	
	@Override
	public void cancleOrder(String orderNum) {
		adminMapper.cancleOrder(orderNum);
	}
	
	@Override
	public void refund(String orderNum) {
		adminMapper.refund(orderNum);
	}
	
	@Override
	public List<ProductVO> getProductList(String type, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		return adminMapper.getProductList(map);
	}
	
	@Override
	public void insertCategoryBoard(AskCategoryBoardVO askCateBoVo) {
		adminMapper.insertCategoryBoard(askCateBoVo);
	}

	@Override
	public void setAsk(AskListVO vo) {
		adminMapper.setAsk(vo);
	}
	
	@Override
	public List<AskListVO> getAskLisk(int userNo) {
		return adminMapper.getAskLisk(userNo);
	}
	
	@Override
	public List<AskListVO> getAdminAskLisk() {
		return adminMapper.getAdminAskLisk();
	}
	
	@Override
	public List<AskListVO> getAskSearchList(String type, String keyword) {
		return adminMapper.getAskSearchList(type, keyword);
	}
	
	@Override
	public void setAskReply(String askNo, String reply) {
		adminMapper.setAskReply(askNo, reply);
	}
	
	@Override
	public List<AskCategoryBoardVO> getAllAskCategoryBoardList(String type, String keyword) {
		return adminMapper.getAllAskCategoryBoardList(type, keyword);
	}
	
	@Override
	public void setAskCategoryReply(String askNo, String reply) {
		adminMapper.setAskCategoryReply(askNo, reply);
	}
}
