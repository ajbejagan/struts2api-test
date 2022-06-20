package webapp.actions;

import webapp.models.CharactersResponse;
import com.opensymphony.xwork2.ActionSupport;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CharactersAction extends ActionSupport {

    private String query;
    private int page = 1;
    private CharactersResponse charactersResponse;

    public String execute() throws Exception {

        String endpoint = "https://rickandmortyapi.com/api/character/?page=" + page;

        if (query != null) {
            endpoint = endpoint + "&name=" + query;
        }

        System.out.println(endpoint);

        try {
 
            URL url = new URL(endpoint);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
 
            if (conn.getResponseCode() != 200) {
                throw new RuntimeException("Failed : HTTP error code : "
                        + conn.getResponseCode());
            }
 
            BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
            String output;
            while ((output = br.readLine()) != null) {
                ObjectMapper mapper = new ObjectMapper();
                charactersResponse = mapper.readValue(output, CharactersResponse.class);
            }
            System.out.println("character response: " + charactersResponse);

            conn.disconnect();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return SUCCESS;

    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public CharactersResponse getCharactersResponse() {
        return charactersResponse;
    }

    public void setCharactersResponse(CharactersResponse charactersResponse) {
        this.charactersResponse = charactersResponse;
    }
    
}
