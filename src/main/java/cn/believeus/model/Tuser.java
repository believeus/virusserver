package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class Tuser {

	private static final long serialVersionUID = -7459216849514123828L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String uuid;
	private String password;
	private String mail;
	private long register;// 注册时间
	private long lastLogin;// 上次登录时间

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public long getRegister() {
		return register;
	}

	public void setRegister(long register) {
		this.register = register;
	}

	public long getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(long lastLogin) {
		this.lastLogin = lastLogin;
	}

}
