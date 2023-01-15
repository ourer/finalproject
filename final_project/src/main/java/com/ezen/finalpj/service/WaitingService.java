package com.ezen.finalpj.service;

import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.domain.WaitingVO;

public interface WaitingService {
	
	int insertMemWaitPost(WaitingVO wvo);

	int remove(String email);

	int accept(String email);

	int refuse(String email);

	int appointment(String email);

	int cancellation(String email);


}
