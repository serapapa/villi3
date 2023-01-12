package com.lec.jdbc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.lec.jdbc.vo.VoteItemVO;
import com.lec.jdbc.vo.VoteVO;



public class VoteRowMapper implements RowMapper<VoteVO> {

	@Override
	public VoteVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		VoteVO vote = new VoteVO();
//		VoteItemVO voteitem = new VoteItemVO();
		vote.setV_title(rs.getString("V_TITLE"));
		vote.setV_etime(rs.getDate("V_ETIME"));
		vote.setV_con(rs.getString("V_CON"));
		vote.setV_item1(rs.getString("V_ITEM1"));
		vote.setV_count1(rs.getString("V_COUNT1"));
		vote.setV_item2(rs.getString("V_ITEM2"));
		vote.setV_count2(rs.getString("V_COUNT2"));
		vote.setV_item3(rs.getString("V_ITEM3"));
		vote.setV_count3(rs.getString("V_COUNT3"));
		vote.setV_item4(rs.getString("V_ITEM4"));
		vote.setV_count4(rs.getString("V_COUNT4"));
		vote.setV_item1Pic(rs.getString("V_ITEM1PIC"));
		vote.setV_id(rs.getInt("V_ID"));
		
		
//		voteitem.setItem(rs.getString("ITEM"));
//		voteitem.setListnum(rs.getInt("LISTNUM"));
		
		return vote;
	}
}
