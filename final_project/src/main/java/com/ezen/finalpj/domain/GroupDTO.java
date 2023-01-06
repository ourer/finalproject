package com.ezen.finalpj.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class GroupDTO {
	private GroupVO gvo;
	private List<ScheduleVO> sList;
}
