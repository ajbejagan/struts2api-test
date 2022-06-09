package webapp.actions;

import com.opensymphony.xwork2.ActionSupport;
import webapp.models.User;

import java.sql.Connection;                
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;

public class RegisterAction extends ActionSupport {
    
    private static final long serialVersionUID = 1L;
    
    private User userBean;
    private String errorMessage;

    public String execute() throws Exception {

        if (saveToDB()) {
            return SUCCESS;
        } else {
            errorMessage = "Something went wrong.";
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
                userBean.getPassword() + "')";
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