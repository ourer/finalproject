package com.ezen.finalpj.domain;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class CapUserDTO {
	private int grno;
	private String uEmail;
	private String uName;
	private String uNickname;
	private int uAge;
	private String uPhone;
	private String uArea;
	private int uGender;
	private String pDir;
	private String pUuid;
	private String pName;
}
