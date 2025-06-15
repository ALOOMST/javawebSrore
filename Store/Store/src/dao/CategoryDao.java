/*package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import bean.Category;
import utils.C3pConnection;

public class CategoryDao {
    public List<Category> getAllCategories() throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT * FROM Category";
        return r.query(sql, new BeanListHandler<>(Category.class));
    }

    public boolean addCategory(Category category) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "INSERT INTO Category (categoryId, categoryName) VALUES (?, ?)";
        int i = r.update(sql, category.getCategoryId(), category.getCategoryName());
        return i > 0;
    }

    public boolean updateCategory(Category category) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "UPDATE Category SET categoryName=? WHERE categoryId=?";
        int i = r.update(sql, category.getCategoryName(), category.getCategoryId());
        return i > 0;
    }

    public boolean deleteCategory(String categoryId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "DELETE FROM Category WHERE categoryId=?";
        int i = r.update(sql, categoryId);
        return i > 0;
    }

    public Category getCategoryById(String categoryId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT * FROM Category WHERE categoryId=?";
        return r.query(sql, new BeanHandler<>(Category.class), categoryId);
    }
}*/