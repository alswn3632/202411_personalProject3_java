package com.ezen.spring.dao;

import java.util.List;

import com.ezen.spring.domain.FileVO;

public interface FileDAO {

	int insertFile(FileVO fvo);

	List<FileVO> getList(long id);

	int deleteFile(String uuid);

	List<FileVO> selectListAllFile();

}
