package webapp.actions;

import webapp.models.User;

import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {
    
    private User user;
    // private String error = "Random";

    public String execute() throws Exception {
        user = new User();

        // checking if naay sud ang user variables
        System.out.println("user: " + user.getFirstname());
        System.out.println("user: " + user.getLastname());
        System.out.println("user: " + user.getUsername());
        System.out.println("user: " + user.getEmail());
        System.out.println("user: " + user.getPassword());

        if (
            user.getFirstname() != null &&
            user.getLastname() != null &&
            user.getUsername() != null &&
            user.getEmail() != null &&
            user.getPassword() != null
        ) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public User getUser() {    
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
}
