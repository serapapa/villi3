package com.lec.jdbc.dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.mapper.VoteRowMapper;
import com.lec.jdbc.vo.PageInfo;
import com.lec.jdbc.vo.VoteItemVO;
import com.lec.jdbc.vo.VoteVO;



@Repository("veportDAO")
public class VoteDAO {

	@Autowired                    
	private JdbcTemplate jdbcTemplate;
	
	private String sql = "";
	private String insert_vote = "insert into vote(v_title,v_con,v_etime) values(?,?,now())";
	private String insert_voteitem = "insert into voteitem(listnum, item) values(?,?)";
	private String get_pageinfo = "select count(*) from vote";
	private String get_vote = "select * from vote where v_id=?";
	private String get_vote_list = "select * from vote order by v_id desc limit ?, ?";
//	private String get_vote_vote = "update vote set v_count1=? where v_id=? and v_item=?";
	

	public List<VoteVO> getVoteList(int currentPage, int perPage) {
		Object[] args = {(currentPage-1)*perPage, perPage};
		return jdbcTemplate.query(get_vote_list, args, new VoteRowMapper());
	}
	public VoteVO getVote(VoteVO vote) {
		Object[] args = {vote.getV_id() };
		return jdbcTemplate.queryForObject(get_vote, args, new VoteRowMapper());
	}

	
	public List<VoteVO> getVoteList(SearchVO searchVO) {
		sql = "select * from vote where 1 = 1 "
		    + " and "      + searchVO.getSearchCategory() 
		    + " like '%"   + searchVO.getSearchWord() + "'%"
		    + " limit    " + searchVO.getCurPage() + ", " + searchVO.getRowSizePerPage()
		    + " order by " + searchVO.getSearchCategory() + "desc";
		return jdbcTemplate.query(sql, new VoteRowMapper());
	}
	
public PageInfo getPageInfo(String tableName, int currentPage, int perPage) {
		
		PageInfo pageInfo = new PageInfo();
		int totalCount = 0;
		int totalPages = 0;
		int startPage = 0;
		int endPage = 0;

		totalCount = jdbcTemplate.queryForInt(get_pageinfo);
		
		if(totalCount>0) {
			totalPages = (int)(totalCount / perPage) + ((totalCount % perPage == 0) ? 0 : 1);
			startPage = (int)(currentPage / perPage) * perPage + 1 + ((currentPage % perPage == 0) ? -perPage : 0);
			endPage = startPage + perPage - 1;
			endPage = (endPage >= totalPages) ? totalPages : endPage;
		}				
		pageInfo.setTotalPages(totalPages);
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		return pageInfo;
	}

	public int insertVote(VoteVO vote, VoteItemVO voteitem) {
		return jdbcTemplate.update(insert_vote, vote.getV_con(), vote.getV_title(), insert_voteitem, voteitem.getItem(), voteitem.getListnum());		
	}
	
	public int getTotalRowCount(SearchVO searchVO) {
		sql = "select count(*) from vote where 1 = 1 "
			    + " and "      + searchVO.getSearchCategory() 
			    + " like '%"   + searchVO.getSearchWord() + "'%"
			    + " limit    " + searchVO.getCurPage() + ", " + searchVO.getRowSizePerPage()
			    + " order by " + searchVO.getSearchCategory() + "desc";
		return jdbcTemplate.queryForInt(sql);
	}
	
}



