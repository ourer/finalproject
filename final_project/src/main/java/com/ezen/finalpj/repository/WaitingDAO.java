package com.ezen.finalpj.repository;

import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.domain.WaitingVO;

public interface WaitingDAO {
	
	int insertMemWaitPost(WaitingVO wvo);

	int deleteUser(String email);

	int acceptUser(String email);

	int refuseUser(String email);

	int appointment(String email);

	int cancellation(String email);

	int quit(WaitingVO wvo);
	
}
