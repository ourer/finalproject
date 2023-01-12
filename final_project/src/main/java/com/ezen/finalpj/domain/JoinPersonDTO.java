package com.ezen.finalpj.domain;

import lombok.Setter;
import lombok.ToString;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class JoinPersonDTO {
	private int sno;
	private String uName;
	private String pName;
	private String pDir;
	private String pUuid;
}
