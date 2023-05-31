package DBTest;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class DatabaseTestThree {
    public static void main(String[] args) {


        String url = "jdbc:mysql://3.239.253.255:3306/syntaxhrm_mysql";
        String username = "syntax_hrm";
        String password = "syntaxhrm123";

        try {
            Connection connection = DriverManager.getConnection(url, username, password);
            System.out.println("Connection is created for Batch15");
            Statement statement = connection.createStatement();
            // ResultSet rset=statement.executeQuery("select FirstName, LastName from person");
            String query = "select* from person";
            ResultSet rset = statement.executeQuery(query);

            // extract datafrom resultset and store it in java data structure
            List<Map<String, String>> listFromRset=new ArrayList<>();
            ResultSetMetaData rsmdata= rset.getMetaData();
            // iterate through the rows
            while (rset.next()){
                Map<String, String> map=new LinkedHashMap<>();
                // iterate over columns
                for (int i = 1; i <=rsmdata.getColumnCount() ; i++) {
                    String key=rsmdata.getColumnName(i);
                    String value= rset.getString(key);
                    map.put(key, value);
                }
                System.out.println(map);
                //adding the map again in order to get all keys and values without being overwritten
                listFromRset.add(map);
            }

        } catch (
                SQLException e) {
            e.printStackTrace();
        }
    }
}