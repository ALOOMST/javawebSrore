package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import bean.User;
import dao.UserDao2;

public class UserService {
    private final UserDao2 userDao = new UserDao2();

    public boolean registerUser(User user) {
        return userDao.registerUser(user);
    }

    public List<Map<String, Object>> selectUser(String name) {
        List<Map<String, Object>> list = null;
        try {
            list = userDao.selectUser(name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateUser(User user) {
        try {
            return userDao.updateUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(int userId) {
        try {
            return userDao.deleteUser(userId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}