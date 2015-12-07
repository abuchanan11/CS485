package db;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class CurrentWeather {
	public static String get() {
		HttpURLConnection connection = null; 
		String targetURL = "api.openweathermap.org/data/2.5/weather?id=5053156&APPID=546f5b587c1c07b8c59dad683fe4bf52";
		
		try {
	    //Create connection
	    URL url = new URL(targetURL);
	    connection = (HttpURLConnection)url.openConnection();
	    connection.setRequestMethod("GET");
	    connection.setRequestProperty("Content-Type", 
	        "application/x-www-form-urlencoded");

	  /*  connection.setRequestProperty("Content-Length", 
	        Integer.toString(urlParameters.getBytes().length));*/
	    connection.setRequestProperty("Content-Language", "en-US");  

	    connection.setUseCaches(false);
	    connection.setDoOutput(true);

	    //Send request
	    DataOutputStream wr = new DataOutputStream (
	        connection.getOutputStream());
	   // wr.writeBytes(urlParameters);
	    wr.close();

	    //Get Response  
	    InputStream is = connection.getInputStream();
	    BufferedReader rd = new BufferedReader(new InputStreamReader(is));
	    StringBuilder response = new StringBuilder(); // or StringBuffer if not Java 5+ 
	    String line;
	    while((line = rd.readLine()) != null) {
	      response.append(line);
	      response.append('\r');
	    }
	    rd.close();
	    return response.toString();
	  } catch (Exception e) {
	    e.printStackTrace();
	    return null;
	  } finally {
	    if(connection != null) {
	      connection.disconnect(); 
	    }
	  }
	}
}
