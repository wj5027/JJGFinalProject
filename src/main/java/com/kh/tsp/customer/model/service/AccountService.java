package com.kh.tsp.customer.model.service;

import java.util.ArrayList;

import com.kh.tsp.customer.model.vo.Member;

public interface AccountService {

	Member selectMyInfo(Member m);

	int changeInfo(Member m);

	int changePwd(Member m);

	Member getRefreshMember(Member m);

}
