package servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // 1. Niche [HOST] aur [PORT] er jaigay Railway-er thikana boshao
    private static final String URL = "jdbc:mysql://mysql.railway.internal:3306/railway?useUnicode=true&characterEncoding=UTF-8";
    
    private static final String USER = "root";
    
    // 2. Niche [PASSWORD] er jaigay Railway-er password boshao (invarted comma "" er bhetore)
    private static final String PASSWORD = "ugHKMMYcLVzfyZknSCifkaLyAOgyfIbc";

    public DBConnection() {}

    public static Connection getConnection() throws SQLException {
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