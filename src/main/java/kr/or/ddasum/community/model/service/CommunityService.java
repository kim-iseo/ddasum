package kr.or.ddasum.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.ddasum.community.model.vo.Community;
import kr.or.ddasum.community.model.vo.CommunityComment;

public interface CommunityService {

	HashMap<String, Object> selectAllCommunity(int currentPage);

	HashMap<String, Object> searchCommunity(HashMap<String, String> search, int currentPage);

	HashMap<String, Object> detailOneCommunity(int cNo);

	int deleteCommunity(int cNo);

	int deleteComment(int comNo);

	void hitCommunity(int cNo);

	int insertCommunity(Community c);

	int insertComment(CommunityComment cc);

	Community selectCommunity(int cNo);

	int updateCommunity(Community c);

	int updateComment(CommunityComment cc);

}
