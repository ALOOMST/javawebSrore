package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import bean.User;
import utils.C3pConnection;

public class UserDao2 {
    public boolean registerUser(User user) {
        try {
            QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
            String sql = "INSERT INTO user (name, email, password, phone, address, isAdmin) VALUES (?, ?, ?, ?, ?, ?)";
            int i = r.update(sql, user.getName(), user.getEmail(), user.getPassword(), user.getPhone(), user.getAddress(), 0); // 默认值为0
            System.out.println("执行UserDao2类的方法");
            if (i > 0) {
                return true;
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Map<String, Object>> selectUser(String name) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        name = "%" + name + "%";
        String sql = "SELECT * FROM user WHERE name LIKE ?";
        return r.query(sql, new MapListHandler(), name);
    }

    public boolean updateUser(User user) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "UPDATE user SET name=?, email=?, password=?, phone=?, address=?, isAdmin=? WHERE userid=?";
        int i = r.update(sql, user.getName(), user.getEmail(), user.getPassword(), user.getPhone(), user.getAddress(), user.getIsAdmin(), user.getUserid());
        return i > 0;
    }

    public boolean deleteUser(int userId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "DELETE FROM user WHERE userid=?";
        int i = r.update(sql, userId);
        return i > 0;
    }
}