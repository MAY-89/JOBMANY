package net.koreate.cboard.service;

public interface CommunityLikeyService {
	
	// 좋아요 삽입삭제
	void Likey(int cbno, int uno) throws Exception;
	
	// 있는지 확인
	int LikeyYN(int cbno, int uno) throws Exception;
}
