package servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
   // Localhost muche Railway er internal link aur database name ('railway') dewa holo
   private static final String URL = "jdbc:mysql://mysql.railway.internal:3306/railway?useUnicode=true&characterEncoding=UTF-8";
   
   private static final String USER = "root";
   
   // Ekhane 'soumen123' muche tomar Railway theke copy kora boro password ta bosabe
   private static final String PASSWORD = "ugHKMMYcLVzfyZknSCifkaLyAOgyfIbc";

   public DBConnection() {
   }

   public static Connection getConnection() throws SQLException {
      // Ekhane r boro link direct na likhe, uporer variable gulo use kora holo jate code clean thake
      return DriverManager.getConnection(URL, USER, PASSWORD);
   }

   static {
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
      } catch (ClassNotFoundException var1) {
         var1.printStackTrace();
      }
   }
}