package com.ezen.finalpj.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CategoryDTO {
	private CategoryVO cvo;
	private List<GroupVO> gList;

}
