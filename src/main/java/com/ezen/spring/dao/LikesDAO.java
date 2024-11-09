package com.ezen.spring.dao;

import org.apache.ibatis.annotations.Param;

public interface LikesDAO {

	int isLike(@Param("bno") long bno, @Param("uno") long uno);
	
	int regLike(@Param("bno") long bno, @Param("uno") long uno);

	int delLike(@Param("bno") long bno, @Param("uno") long uno);

}
