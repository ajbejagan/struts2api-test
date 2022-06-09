package webapp.actions;

import webapp.models.User;

import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {
    
    private static final long serialVersionUID = 1L;
    
    private User userBean;

    public String execute() throws Exception {
        //call Service class to store userBean's state in database
        
        if (userBean != null) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
    
    public User getUserBean() {
        return userBean;
    }
    
    public void setUserBean(User user) {
        userBean = user;
    }

}