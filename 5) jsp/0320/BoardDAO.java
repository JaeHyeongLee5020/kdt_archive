package web.tag.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import web.tag.db.OracleDB;
import web.tag.dto.BoardDTO;

public class BoardDAO extends OracleDB {

	private Connection conn = null;			// DB 연결
	private PreparedStatement pstmt = null;	// SQL문 실행
	private ResultSet rs = null;			// 검색 결과 저장
	
	public int insertBoard(BoardDTO dto) {
		int result = 0;
		conn = getConnection();
		
		String sql = "insert into board values(board_seq.nextval, ?, ?, ?, 0, sysdate, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getSave());
			result = pstmt.executeUpdate();	// 글작성시 1 , 글작성 실패시 0
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getClose(conn, pstmt, rs);
		}
		return result;
	}
	
	// select * from board order by num desc
	public ArrayList<BoardDTO> listSelect() {
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		conn = getConnection();
		
		String sql = "select * from board order by num desc";
		try {
			pstmt = conn.prepareStatement(sql);
			// 56개의 글이 모두 ResultSst에 담겨있다.
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setReg(rs.getTimestamp("reg"));
				dto.setSave(rs.getString("save"));
				boardList.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getClose(conn, pstmt, rs);
		}
		return boardList;
	}
	
	public BoardDTO content(int num) {
		BoardDTO dto = new BoardDTO();
		conn = getConnection();
		String sql = "select * from board where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setReg(rs.getTimestamp("reg"));
				dto.setSave(rs.getString("save"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getClose(conn, pstmt, rs);
		}
		return dto;
	}
	
	public int updateBoard(BoardDTO dto) {
		int result = 0;
		conn = getConnection();
		
		// update board set title=?, content=?', save=? where num=?
String sql = "update board set title=?, content=?, save=? where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getSave());
			pstmt.setInt(4, dto.getNum());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getClose(conn, pstmt, rs);
		}
		return result;
	}
}





































