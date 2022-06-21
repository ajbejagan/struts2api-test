package webapp.actions;

import com.opensymphony.xwork2.ActionSupport;
import webapp.models.User;

import java.sql.PreparedStatement;
import java.sql.Connection;                
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.nio.charset.StandardCharsets;
import java.security.*;

public class LoginAction extends ActionSupport {

    private static User accountBean;
    private String errorMessage;
    private String token;

    public String execute() throws Exception {

        if (validate(accountBean.getUsername(), accountBean.getPassword())){
            token = "faketoken";
            return SUCCESS;
        } else {
            errorMessage = "Username or password is incorrect.";
            return ERROR;
        }
        
    }

    public static boolean validate(String username, String password) throws NoSuchAlgorithmException {  
        
        boolean status = false;
        String encryptedPassword = encryptPassword(password);
        
        try {
            String URL = "jdbc:mysql://localhost:3306/struts2api?useTimezone=true&serverTimezone=UTC";
            String root = "root";
            String dbPassword = "password";

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(URL, root, dbPassword);
        
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, encryptedPassword);

            ResultSet rs = ps.executeQuery();
            status = rs.next();

            accountBean.setFirstname(rs.getString(2));
            accountBean.setLastname(rs.getString(3));
            accountBean.setAge(rs.getInt(4));
            accountBean.setEmail(rs.getString(5));
            accountBean.setUsername(rs.getString(6));
            accountBean.setPassword(rs.getString(7));

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static String encryptPassword(String password) throws NoSuchAlgorithmException {

        String encryptedText;

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes(StandardCharsets.UTF_8));
        StringBuilder s = new StringBuilder();

        for(int i=0; i<  hash.length; i++) {  
            s.append(Integer.toString((hash[i] & 0xff) + 0x100, 16).substring(1));  
        }

        encryptedText = s.toString();

        return encryptedText;
    }

    public User getAccountBean() {
        return accountBean;
    }
    
    public void setAccountBean(User account) {
        accountBean = account;
    }
    
    public String getErrorMessage() {
        return errorMessage;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

}
