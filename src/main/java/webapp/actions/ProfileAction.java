package webapp.actions;

import com.opensymphony.xwork2.ActionSupport;

public class ProfileAction extends ActionSupport {

    private String token;
    
    public String execute() throws Exception {

        if (token != null) {
            return SUCCESS;
        } else {
            return ERROR;
        }
        
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

}
