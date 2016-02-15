/**
 * Created by Karthik on 21/01/2016.
 */
import java.sql.*;
import java.sql.Connection;
import java.sql.Statement;

import com.mysql.jdbc.*;

public class DriverSetup {
    public static void main(String[] args){
        dbQuery();
    }

    static void dbQuery(){
        try {

            //getting information from a table
            Connection con = DriverManager.getConnection("jdbc:mysql://109.201.130.1/kastleap_FormulaOne?" +
                    "user=kastleap_kar&password=password1");
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM user");
            while (rs.next()){
                System.out.println(rs.getString("username") + " " + rs.getString("password"));
            }

            //insert information into table
            /*Connection con = DriverManager.getConnection("jdbc:mysql://localhost/formulaone", "root", "");
            Statement statement = con.createStatement();
            statement.executeUpdate("INSERT INTO stat(speed, pressure, torque) VALUES (200, 40.5, 33.7)");*/

            //con.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
