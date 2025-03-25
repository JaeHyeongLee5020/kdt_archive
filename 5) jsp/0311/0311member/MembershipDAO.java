package web.tag.dao;
import java.util.ArrayList;
import web.tag.dto.MembershipDTO;

public class MembershipDAO {
	
	// 모든 사용자가 같은 객체를 사용하기위해서 내부에서 객체를 생성
	private static MembershipDAO dao = new MembershipDAO();
	
	// 외부에서 객체 생성을 막기위해 생성자의 접근 제한자를 private으로 변경
	private MembershipDAO () {
		
	}
	
	// 회원 정보 저장소
	private ArrayList<MembershipDTO> memberList = new ArrayList<MembershipDTO>();
	
	// 외부에서 객체를 만들지 않고 메소드를 사용해서 같은 객체를 사용하도록 dao객체를 리턴
	public static MembershipDAO getInstance() {
		return dao;
	}
	
	// 회원정보를 list에 저장하는 메소드
	public void insertMember(MembershipDTO dto) {
		memberList.add(dto);
	}
	
	// 현재 가입자 수를 확인하기위한 메소드
	public int memberCount() {
		int result = memberList.size();
		return result;
	}
	
	// 회원 정보를 답고있는 list를 리턴
	public ArrayList<MembershipDTO> getList() {
		return memberList;
	}
	
	// 회원 정보를 리턴하는 메서드
	public MembershipDTO matchId(String id) {
		MembershipDTO dto = null;
		for(MembershipDTO mem : memberList) {
			if(id.equals(mem.getId())) {
				dto = mem;
				break;
			}
		}
		return dto;
	}
}





