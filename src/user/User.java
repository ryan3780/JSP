//JSP 자바빈즈라고 한다. 이 자바 클래스를!!
package user;

// Model로 사용되는 건 lombok 한 번 찾아서 써보는걸 추천드려요
// get,set 메소드 만들 필요 없음
public class User {

	private String userID; // 왠만하면 카멜기법이 되도록 userId 가 되는게 좋습니다.
	private String userPassword;
	private String userName;
	private String userGender;
	private String userEmail;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
}

