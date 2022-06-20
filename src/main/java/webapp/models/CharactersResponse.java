package webapp.models;

import java.util.ArrayList;

public class CharactersResponse {

    private Info info;
    ArrayList<Character> results;

    public Info getInfo() {
        return info;
    }

    public void setInfo(Info info) {
        this.info = info;
    }

    public ArrayList<Character> getResults() {
        return results;
    }

    public void setResults(ArrayList<Character> results) {
        this.results = results;
    }

}
