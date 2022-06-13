package webapp.actions;

import webapp.models.NewsResponse;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import com.fasterxml.jackson.databind.ObjectMapper;

public class NewsAction extends ActionSupport {
    
    private String API_KEY = "0bf82321290f4c0a8548f8bd19427309";
    private NewsResponse newsResponse;

    public String execute() throws Exception {

        String format = "yyyy-MM-dd";
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        String currentDate = dateFormat.format(calendar.getTime());

        try {
 
            URL url = new URL("https://newsapi.org/v2/everything?q=tesla&from=" + currentDate
                    + "&sortBy=publishedAt&apiKey=" + API_KEY + "&language=en");
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
                newsResponse = mapper.readValue(output, NewsResponse.class);
            }
            System.out.println("NR: " + newsResponse);
            conn.disconnect();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return SUCCESS;

    }

    public NewsResponse getNewsResponse() {
        return newsResponse;
    }

    public void setNewsResponse(NewsResponse newsResponse) {
        this.newsResponse = newsResponse;
    }

}
