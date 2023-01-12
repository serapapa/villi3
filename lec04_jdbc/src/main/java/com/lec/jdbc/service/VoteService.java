package com.lec.jdbc.service;

import java.util.List;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.vo.PageInfo;
import com.lec.jdbc.vo.VoteItemVO;
import com.lec.jdbc.vo.VoteVO;

public interface VoteService {

	VoteVO getVote(VoteVO vote);
	List<VoteVO> getVoteList(int currentPage, int perPage);
	PageInfo getPageInfo(int currentPage, int perPage);
	
	List<VoteVO> getVoteList(SearchVO searchVO);
	int getTotalRowCount(SearchVO searchVO);
	int insertVote(VoteVO vote, VoteItemVO voteitem);	
	
}
