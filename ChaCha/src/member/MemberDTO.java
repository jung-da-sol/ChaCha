package member;

public class MemberDTO {

	String MemberID;
	String MemberPassword;
	String MemberName;
	String MemberEmail;
	String MemberProfile;
	
	public String getMemberID() {
		return MemberID;
	}
	public void setMemberID(String memberID) {
		MemberID = memberID;
	}
	public String getMemberPassword() {
		return MemberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		MemberPassword = memberPassword;
	}
	public String getMemberName() {
		return MemberName;
	}
	public void setMemberName(String memberName) {
		MemberName = memberName;
	}
	public String getMemberEmail() {
		return MemberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		MemberEmail = memberEmail;
	}
	public String getMemberProfile() {
		return MemberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		MemberProfile = memberProfile;
	}
	
	public MemberDTO() {
		
	}
	
	public MemberDTO(String memberID, String memberPassword, String memberName, String memberEmail,
			String memberProfile) {
		super();
		MemberID = memberID;
		MemberPassword = memberPassword;
		MemberName = memberName;
		MemberEmail = memberEmail;
		MemberProfile = memberProfile;
	}
	
	
	
	
}
