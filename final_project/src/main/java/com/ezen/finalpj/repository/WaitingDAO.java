package com.ezen.finalpj.repository;

import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.domain.WaitingVO;

public interface WaitingDAO {

	int insertMemWaitPost(WaitingVO wvo);
	
	int deleteUser(String email);

	int acceptUser(UserVO uvo);

	int refuseUser(String email);

}
