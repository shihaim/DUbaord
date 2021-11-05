package com.hsw.du.board.service.impl;

import java.io.File;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.uuid.Generators;
import com.hsw.du.board.dao.BoardDAO;
import com.hsw.du.board.domain.BoardAttFileVO;
import com.hsw.du.board.domain.BoardVO;
import com.hsw.du.board.service.BoardService;
import com.hsw.du.common.Pagination;
import com.hsw.du.user.domain.UserVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> selectBoardList(Pagination pagination, String title) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("startList", pagination.getStartList());
		map.put("listSize", pagination.getListSize());
		map.put("title", "%" + title + "%");
		
		return boardDAO.selectBoardList(map);
	}
	
	@Override
	public BoardVO selectBoard(long idx) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoard(idx);
	}

	@Override
	public void insertBoard(BoardVO board, HttpSession session) {
		// TODO Auto-generated method stub
		UserVO user = (UserVO) session.getAttribute("USER");
		
		if(user == null) { return; }
		
		board.setWriterId(user.getId());
		boardDAO.insertBoard(board);
		
		insertBoardAttFile(board);
	}

	@Override
	public void updateBoard(BoardVO board, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		UserVO user = (UserVO) session.getAttribute("USER");
		
		if(user == null) { return; }
		
		board.setWriterId(user.getId());
		
		boardDAO.updateBoard(board);
		updateBoardAttFile(board);
	}

	private void updateBoardAttFile(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		String handleType = board.getHandleType();
		BoardAttFileVO criteria = board.getCriteria();
		boolean hasAttFile = board.hasAttFile();
		
		if("fix".equals(handleType)) {
			return;
		}
		if(hasAttFile) {
			deleteBoardAttFile(criteria);
		}
		if("del".equals(handleType)) {
			return;
		} else if ("chg".equals(handleType)) {
			insertBoardAttFile(board);
		}
	}

	@Override
	public void deleteBoard(long idx) throws Exception {
		// TODO Auto-generated method stub
		
		boardDAO.deleteBoard(idx);

	}
	
	
	private void insertBoardAttFile(BoardVO board) {
		// TODO Auto-generated method stub
		if(!board.isExistAttFile()) {
			return;
		}
		
		BoardAttFileVO attFileVO = new BoardAttFileVO(board);
		try {
			uploadBoardAttFileVO(attFileVO);
		} catch (Exception e) {
			// TODO: handle exception
			new RuntimeException();
		}
		boardDAO.insertBoardAttFile(attFileVO);
	}

	private void uploadBoardAttFileVO(BoardAttFileVO attFileVO) throws Exception {
		// TODO Auto-generated method stub
		// filePath
		String fileStorePath = "C:\\Temp\\upload\\";
		String dailyPath = LocalDate.now().toString();
		String filePath = fileStorePath + dailyPath;
		
		File directory = new File(filePath);
		if(!directory.exists()) {
			directory.mkdirs();
		}
		attFileVO.setFilePath(filePath);
		
		// oldFilename
		MultipartFile multipartFile = attFileVO.getAttFile();
		String orginalFilename = multipartFile.getOriginalFilename();
		attFileVO.setOldFilename(orginalFilename);
		
		// newFilename and fileSize
		int pos = orginalFilename.lastIndexOf(".");
		String ext = orginalFilename.substring(pos);
		String newFilenameBody = Generators.timeBasedGenerator().generate().toString();
		String newFilename = newFilenameBody + ext;
		attFileVO.setNewFilename(newFilename);
		attFileVO.setFileSize(multipartFile.getSize());
		
		// real file copy
		File newFile = new File(filePath + File.separator + newFilename);
		multipartFile.transferTo(newFile);
	}

	@Override
	public BoardAttFileVO findBoardAttFile(BoardAttFileVO criteria) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardAttFile(criteria);
	}

	@Override
	public void deleteBoardAttFile(BoardAttFileVO criteria) throws Exception{
		// TODO Auto-generated method stub
		BoardAttFileVO attFileVO = boardDAO.selectBoardAttFile(criteria);
		String fullAttFilePath = attFileVO.getFullAttFilePath();
		
		File file = new File(fullAttFilePath);
		if(file.exists() && !file.isDirectory()) {
			file.delete();
		}
		
		boardDAO.deleteBoardAttFile(criteria);
	}

	@Override
	public int selectBoardListCnt(String title) {
		// TODO Auto-generated method stub
		title = "%" + title + "%";
		return boardDAO.selectBoardListCnt(title);
	}
	

}
