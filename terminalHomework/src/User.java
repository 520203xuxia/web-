import java.util.Date;

public class User {
	private String IDNumber;
    private String username;
    private String passwd;
    private String email;
    private String flag;
    private Object date;
    private User user;

    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User(String IDNumber,String username, String passwd, String email, String flag, Date date) {
        this.IDNumber=IDNumber;
    	this.username = username;
        this.passwd = passwd;
        this.email = email;
        this.flag = flag;
        this.date = date;
    }

    public User() {
    }

    public String getIDNumber() {
        return this.IDNumber;
    }

    public void setIDNumber(String IDNumber) {
        this.IDNumber = IDNumber;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasswd() {
        return this.passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getEmail() {
        return this.email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getFlag() {
        return this.flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }
   
    public Object getDate() {
        return this.date;
    }

    public void setDate(Object date) {
        this.date = date;
    }
    
    /*
    public String toString() {
        return "User{name='" + this.username + '\'' + ", password='" + this.password + '\'' + ", email='" + this.email + '\'' + ", randomcode='" + this.randomcode + '\'' + ", date=" + this.date + '}';
    }*/
}
