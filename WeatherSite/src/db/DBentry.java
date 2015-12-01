/*
 * Program: CS485_lab6
 * Purpose: The program is designed to illustrate 1) the use of SQL connector 
 * to connect to and update on MySQL database; 2) the use of JSP to create a
 * Web page for data entry. To make the program work, both JDK, Apache, MySQL
 * need to be installed.
 * @copyright the program is intended for class use, it should not be distributed
 * outside the class without permission from the instructor, Dr. Mingrui Zhang  
 */
package db;
import java.sql.*;


public class DBentry {
	static DBentry instance = new DBentry();
	Connection dbconn;
	ResultSet results = null;
	PreparedStatement sql;
	String dpwd = null;
	StringBuilder sb = new StringBuilder();
	boolean empty = false;
	
	//change URL to your database server as needed
	String dbPath="jdbc:mysql://localhost:3306";
	
	public static DBentry getInstance() {
		if (instance==null) {
			instance = new DBentry();
		}
		return instance;
	}
	
	//Establish connection to MySQL server
	public Connection newConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			
			try {			
				dbconn = DriverManager.getConnection(dbPath,"root","");
				System.out.println("gain the connection");
				return dbconn;
			}
			catch (Exception s){
				System.out.println(s.getStackTrace().toString());}
		}
		catch (Exception err){
			System.out.println(err.getStackTrace().toString());
		}
		return null;
	}
	
	public ResultSet selectStatement( String query ) {
		try {
			
			dbconn=instance.newConnection();
			sql=dbconn.prepareStatement(query);
			ResultSet results;
			results=sql.executeQuery();
			if(!results.next()){
				empty = true;
			}
			System.out.println("query="+query);
			
			//WARNING!
			//Need to process ResultSet before closing connection
			dbconn.close();
			return results;
		}
		catch (Exception err) {
			System.out.println(err.getMessage());
			return null;
		}
	}

	public boolean DBentry( String query ) {
		try {
			System.out.println("query="+query);
			instance.newConnection();
			sql=dbconn.prepareStatement(query);
			sql.executeUpdate(query);
			dbconn.close();
			return true;
		}
		catch ( Exception err ) {
			err.getStackTrace();
			return false;
		}
	}
	
	public boolean entry( String first, String last, String address, String ccnumString, int visa, int master,
			String itemnumString, String priceString) {
		try {
			int itemnum = Integer.parseInt(itemnumString);
			double price = Double.parseDouble(priceString);
			instance.DBentry("INSERT INTO cs485_lab.customers (FirstName, LastName, Address, CreditCardNum, Visa, MasterCard, ItemNum, Price) " +
								"VALUES ('"+first+"','"+last+"','"+address+"','"+ccnumString+"','"+visa+"','"+master+"','"+itemnum+"','"+price+"');");
			return true;
		}
		catch ( Exception err ) {
			err.getStackTrace();
			return false;
		}
	}
	
	public boolean userlookup (String user, String password){
		try{
			ResultSet results = selectStatement("SELECT * FROM cs485_lab.users WHERE username = '"+user+"' AND password = '"+password+"';");
			if (empty){
				return false;
			}else{
				return true;
			}
		}catch (Exception err){
			err.getStackTrace();
			return false;
		}
	}
	
	public boolean newUser(String user, String password, String firstName, String lastName){
		try{
			instance.DBentry("INSERT INTO cs485_lab.users (username, password, FirstName, LastName) " + "VALUES ('"+user+"','"+password+"','"+firstName+"','"+lastName+"');");
			return true;
		}catch (Exception err){
			System.out.println(err.getStackTrace());
			return false;
		}
	}
	
	public static void main(String[] args) {	
		
	}
}