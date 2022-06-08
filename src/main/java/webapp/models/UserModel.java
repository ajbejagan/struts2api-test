package webapp.models;

public class UserModel {
    private String firstname = "AJ";
    private String email = "ajbejagan@gmail.com";
    private String password = "admin";

    public UserModel() {}

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
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

}
