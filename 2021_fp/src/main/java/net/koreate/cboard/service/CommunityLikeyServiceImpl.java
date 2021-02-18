package net.koreate.cboard.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.cboard.dao.CommunityLikeyDAO;

@Service
public class CommunityLikeyServiceImpl implements CommunityLikeyService {
	
	@Inject
	CommunityLikeyDAO dao;
	
	@Override
	public void Likey(int cbno, int uno) throws Exception {
		int result = dao.LikeyYN(cbno, uno);
		
		if(result==1) {
			dao.outLikey(cbno, uno);
		}else {
			dao.inLikey(cbno, uno);
		}
	}

	@Override
	public int LikeyYN(int cbno, int uno) throws Exception {
		return dao.LikeyYN(cbno, uno);
	}
	
	

}
