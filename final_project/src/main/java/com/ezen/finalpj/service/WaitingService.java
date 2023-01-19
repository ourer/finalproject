package com.ezen.finalpj.service;


import com.ezen.finalpj.domain.WaitingVO;

public interface WaitingService {
	
	int insertMemWaitPost(WaitingVO wvo);

	int remove(WaitingVO wvo);

	int acceptWaiting(WaitingVO wvo);

	int refuseWaiting(WaitingVO wvo);

	int appointment(WaitingVO wvo);

	int cancellation(WaitingVO wvo);

	WaitingVO selectGetWaiting(String email);

	int selectGrpCount(int grno);

	WaitingVO selectUserGrp(String email);

}
