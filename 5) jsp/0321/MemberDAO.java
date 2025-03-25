package web.tag.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import web.tag.db.OracleDB;
import web.tag.dto.MemberDTO;
public class MemberDAO extends OracleDB {

	private Connection conn = null;			// DB 연결
	private PreparedStatement pstmt = null;	// SQL문 실행
	private ResultSet rs = null;			// 검색 결과 
	
	public int loginCheck(MemberDTO dto) {
		int result = 0;
		conn = getConnection();
		
		String sql = "select count(*) cnt from member where id=? and pw=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getClose(conn, pstmt, rs);
		}
		return result;
	}
	
	
	public ArrayList<MemberDTO> membershipCheck(int status) {
		conn = getConnection();
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		String sql = "select * from member where status=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setReg(rs.getTimestamp("reg"));
				dto.setStatus(rs.getInt("status"));
				memberList.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getClose(conn, pstmt, rs);
		}
		
		return memberList;
	}
}




























