package webapp.actions;

import com.opensymphony.xwork2.ActionSupport;
import webapp.models.User;

import java.sql.Connection;                
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.nio.charset.StandardCharsets;
import java.security.*;

public class RegisterAction extends ActionSupport {
    
    private static final long serialVersionUID = 1L;
    
    private User userBean;
    private String errorMessage;

    public String execute() throws Exception {

        if (saveToDB()) {
            return SUCCESS;
        } else {
            return ERROR;
        }

    }

    public boolean saveToDB() throws SQLException {

        Connection connection = null;
        Statement statement = null;

        try {

            String URL = "jdbc:mysql://localhost:3306/struts2api?useTimezone=true&serverTimezone=UTC";
            String root = "root";
            String password = "password";

            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(URL, root, password);

            if (connection != null) {
                statement = connection.createStatement();

                String insertQuery = "INSERT INTO users(firstname, lastname, age, email, username, password) VALUES('" +
                userBean.getFirstname() + "', '" +
                userBean.getLastname() + "', '" +
                userBean.getAge() + "', '" +
                userBean.getEmail() + "', '" +
                userBean.getUsername() + "', '" +
                encryptPassword(userBean.getPassword()) + "')";
                statement.executeUpdate(insertQuery);

                return true;
            } else {
                errorMessage = "Failed connecting to database.";
                return false;
            }

        } catch (Exception e) {
            errorMessage = e.toString();
            return false;
        } finally {
            if (statement != null) try { statement.close();} catch (SQLException ignore) {}
            if (connection != null) try { connection.close();} catch (SQLException ignore) {}
        }
    }

    public String encryptPassword(String password) throws NoSuchAlgorithmException {

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

    public String getErrorMessage() {
        return errorMessage;
    }
    
    public User getUserBean() {
        return userBean;
    }
    
    public void setUserBean(User user) {
        userBean = user;
    }

}