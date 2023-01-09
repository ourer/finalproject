package com.ezen.finalpj.repository;

import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.domain.WaitingVO;

public interface WaitingDAO {

	//int insertManagerWaitPost(UserVO uvo);

	int insertMemWaitPost(WaitingVO wvo);

}
