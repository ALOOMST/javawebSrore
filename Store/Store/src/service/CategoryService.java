/*package service;

import java.sql.SQLException;
import java.util.List;

import bean.Category;
import dao.CategoryDao;

public class CategoryService {
    private final CategoryDao categoryDao = new CategoryDao();

    public List<Category> getAllCategories() {
        try {
            return categoryDao.getAllCategories();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean addCategory(Category category) {
        try {
            return categoryDao.addCategory(category);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateCategory(Category category) {
        try {
            return categoryDao.updateCategory(category);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCategory(String categoryId) {
        try {
            return categoryDao.deleteCategory(categoryId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Category getCategoryById(String categoryId) {
        try {
            return categoryDao.getCategoryById(categoryId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}*/
