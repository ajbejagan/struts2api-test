package webapp.actions;

import webapp.models.UserModel;

import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {
    private UserModel user;

    public String execute() {
        user = new UserModel();

        return SUCCESS;
    }

    public UserModel getUser() {    
        return user;
    }
    
}
