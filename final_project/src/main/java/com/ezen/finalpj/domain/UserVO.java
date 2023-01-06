package com.ezen.finalpj.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class UserVO {
	private String email;
	private int ctno;
	private String name;
	private String pw;
	private String area;
	private String nickname;
	private int age;
	private int gender;
	private String phone;
	private String isDel;
	private int ctno_1;
	private int ctno_2;
	private int ctno_3;
}