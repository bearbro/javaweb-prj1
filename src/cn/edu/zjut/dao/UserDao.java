package cn.edu.zjut.dao;

import cn.edu.zjut.model.UserBean;

import java.sql.*;

/**
 * Created by Bro、小熊 on 2017/10/1.
 */
public class UserDao {
    private static final String GET_ONE_SQL = "SELECT * FROM usertable WHERE username=? AND password=? AND type= ?";
    private static final String ADD_ONE_SQL = "INSERT INTO usertable VALUES(?,?,?)";

    public UserDao() {
    }

    public Connection getConnection() {
        Connection conn = null;
        String driver = "com.mysql.jdbc.Driver";
        String dburl = "jdbc:mysql://localhost:3306/myDB";
        String username = "root";
        String password = "admin";
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(dburl, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public boolean searchUser(UserBean user) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(GET_ONE_SQL);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setInt(3, Integer.valueOf(user.getType()));
            rst = pstmt.executeQuery();
            if (rst.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, pstmt);
        }
        return false;
    }

    private void closeConnection(Connection conn, PreparedStatement pstmt) {
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean insert(UserBean user) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(ADD_ONE_SQL);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setInt(3, Integer.valueOf(user.getType()));
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, pstmt);
        }
        return false;

    }
}
