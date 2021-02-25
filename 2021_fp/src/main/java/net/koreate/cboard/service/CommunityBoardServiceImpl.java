package net.koreate.cboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.cboard.dao.CommunityBoardDAO;
import net.koreate.cboard.dao.CommunityCommentDAO;
import net.koreate.cboard.vo.CommunityBoardVO;
import net.koreate.util.PageMaker;
import net.koreate.util.SearchCriteria;

@Service
public class CommunityBoardServiceImpl implements CommunityBoardService {

	@Inject
	CommunityBoardDAO dao;
	@Inject
	CommunityCommentDAO	cdao;
	
	@Override
	public void regist(CommunityBoardVO vo) throws Exception {
		dao.regist(vo);
	}

	@Override
	public List<CommunityBoardVO> listReplyCriteria(SearchCriteria cri) throws Exception {
		List<CommunityBoardVO> list = dao.listCriteria(cri);
		
		return list;
	}

	@Override
	public Map<String, Object> getListModel(SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", listReplyCriteria(cri));
		map.put("pm", getPageMaker(cri));
		
		return map;
	}

	@Override
	public PageMaker getPageMaker(SearchCriteria cri) throws Exception {
		System.out.println("getPageMaker");
		int totalCount = dao.listReplyCount(cri);
		System.out.println(totalCount);
		PageMaker pm = new PageMaker(cri, totalCount);
		return pm;
	}

	@Override
	public CommunityBoardVO readReply(int cbno) throws Exception {
		return dao.readReply(cbno);
	}

	@Override
	public void updateCnt(int cbno) throws Exception {
		dao.updateCnt(cbno);
	}

	@Override
	public void modify(CommunityBoardVO vo) throws Exception {
		dao.modify(vo);
	}

	@Override
	@Transactional
	public void removeBoard(int cbno) throws Exception {
		cdao.delete(cbno);
		dao.removeBoard(cbno);
		
	}

	@Override
	public List<CommunityBoardVO> mainList(String data) {
		return dao.mainList(data);
	}
	
	

}
