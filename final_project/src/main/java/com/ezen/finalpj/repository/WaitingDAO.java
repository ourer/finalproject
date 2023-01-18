package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.domain.WaitingVO;

public interface WaitingDAO {
	
	int insertMemWaitPost(WaitingVO wvo);

	int deleteUser(String email);

	int appointment(String email);

	int cancellation(String email);

	WaitingVO selectGetWaiting(String email);

	int acceptWaiting(WaitingVO wvo);

	int refuseWaiting(WaitingVO wvo);

	int selectGrpCount(int grno);

}
