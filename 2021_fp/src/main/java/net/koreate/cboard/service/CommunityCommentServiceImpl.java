package net.koreate.cboard.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.cboard.dao.CommunityCommentDAO;
import net.koreate.cboard.vo.CommunityCommentVO;

@Service
public class CommunityCommentServiceImpl implements CommunityCommentService {

	@Inject
	CommunityCommentDAO dao;

	@Override
	@Transactional
	public void addComment(CommunityCommentVO vo) throws Exception {

		if (vo.getCcorigin() == 0) {
			dao.addComment(vo);
			dao.updateOrigin();
		} else {
			dao.replyRegist(vo);
		}
	}

	@Override
	public void update(CommunityCommentVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(int ccno, int ccorigin, int ccdepth) throws Exception {
		if (ccdepth == 1) {
			dao.delete(ccno);
			int count = dao.originCount(ccorigin);
			if(count==1) {
				char check = dao.commentCheck(ccorigin);
				if(check=='N') {
					dao.delete(ccorigin);
				}
			}
		}else {
			int count = dao.originCount(ccorigin);
			if(count>=2) {
				dao.deleteShowview(ccno);
			}else {
				dao.delete(ccno);
			}
		}
	}

	@Override
	public List<CommunityCommentVO> commentList(int cbno) throws Exception {
		return dao.commentList(cbno);
	}

	@Override
	public void replyRegister(CommunityCommentVO vo) throws Exception {

		vo.setCcdepth(vo.getCcdepth() + 1);

		dao.replyRegist(vo);
	}

	@Override
	public void remove(int ccno) throws Exception {
		dao.delete(ccno);
	}

	@Override
	public int listCount(int cbno) throws Exception {
		return dao.listCount(cbno);
	}

}
