package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.domain.WaitingVO;

public interface WaitingService {
	
	int insertMemWaitPost(WaitingVO wvo);

	int remove(String email);

	int acceptWaiting(WaitingVO wvo);

	int refuseWaiting(WaitingVO wvo);

	int appointment(WaitingVO wvo);

	int cancellation(WaitingVO wvo);
	
	int selectGrpCount(int grno);

	WaitingVO selectUserGrp(String email);
	
	int quit(WaitingVO wvo);

}
