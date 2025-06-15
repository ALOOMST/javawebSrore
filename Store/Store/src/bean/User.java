package bean;

public class User {
    private String userid;
    private String name;
    private String email;
    private String password;
    private String phone;
    private String address;
    private int isAdmin; // 添加管理员标识字段

    // 构造函数
    public User(String name, String email, String password, String phone, String address) {
        super();
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.isAdmin = 0; // 默认值为0
    }

    public User() {
        super();
    }

    public User(String userid, String name, String email, String password, String phone, String address, int isAdmin) {
        super();
        this.userid = "default";
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.isAdmin = isAdmin;
    }

    // Getter 和 Setter
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", name=" + name + ", email=" + email + ", password=" + password + ", phone="
				+ phone + ", address=" + address + ", isAdmin=" + isAdmin + "]";
	}

	


}