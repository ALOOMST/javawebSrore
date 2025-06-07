package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import bean.Product;
import utils.C3pConnection;

public class ProductDao {
	public List<Product> getAllProducts() throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT * FROM Product";
        return r.query(sql, new BeanListHandler<>(Product.class));
    }

    public boolean addProduct(Product product) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "INSERT INTO Product (productName, price, stock, imagepath, descrition) VALUES (?, ?, ?, ?, ?)";
        int i = r.update(sql, product.getProductName(), product.getPrice(), product.getStock(), product.getImagepath(), product.getDescrition());
        return i > 0;
    }

    public boolean updateProduct(Product product) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "UPDATE Product SET productName=?, price=?, stock=?, imagepath=?, descrition=? WHERE productId=?";
        int i = r.update(sql, product.getProductName(), product.getPrice(), product.getStock(), product.getImagepath(), product.getDescrition(), product.getProductId());
        return i > 0;
    }

    public boolean deleteProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "DELETE FROM Product WHERE productId=?";
        int i = r.update(sql, productId);
        return i > 0;
    }

    public List<Product> searchProducts(String keyword) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT * FROM Product WHERE productName LIKE ?";
        return r.query(sql, new BeanListHandler<>(Product.class), "%" + keyword + "%");
    }

    public Product getProductById(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT * FROM Product WHERE productId=?";
        return r.query(sql, new BeanHandler<>(Product.class), productId);
    }

    public boolean addHotProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "INSERT INTO hot_products (productId) VALUES (?)";
        int i = r.update(sql, productId);
        return i > 0;
    }

    public boolean removeHotProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "DELETE FROM hot_products WHERE productId=?";
        int i = r.update(sql, productId);
        return i > 0;
    }
  public boolean addcantAffordSeriesProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "INSERT INTO cantAffordSeries_products (productId) VALUES (?)";
        int i = r.update(sql, productId);
        return i > 0;
    }

    public boolean removecantAffordSeriesProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "DELETE FROM cantAffordSeries_products WHERE productId=?";
        int i = r.update(sql, productId);
        return i > 0;
    } 
    public boolean addnaifenSeriesProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "INSERT INTO naifenSeries_products (productId) VALUES (?)";
        int i = r.update(sql, productId);
        return i > 0;
    }

    public boolean removenaifenSeriesProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "DELETE FROM naifenSeries_products WHERE productId=?";
        int i = r.update(sql, productId);
        return i > 0;
    } 
    public boolean addphoneSeriesProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "INSERT INTO phoneSeries_products (productId) VALUES (?)";
        int i = r.update(sql, productId);
        return i > 0;
    }

    public boolean removephoneSeriesProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "DELETE FROM phoneSeries_products WHERE productId=?";
        int i = r.update(sql, productId);
        return i > 0;
    } 
    public boolean addzhiniaokuSeriesProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "INSERT INTO zhiniaokuSeries_products (productId) VALUES (?)";
        int i = r.update(sql, productId);
        return i > 0;
    }

    public boolean removezhiniaokuSeriesProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "DELETE FROM zhiniaokuSeries_products WHERE productId=?";
        int i = r.update(sql, productId);
        return i > 0;
    }
    public boolean addweiyangSeriesProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "INSERT INTO weiyangSeries_products (productId) VALUES (?)";
        int i = r.update(sql, productId);
        return i > 0;
    }

    public boolean removeweiyangSeriesProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "DELETE FROM weiyangSeries_products WHERE productId=?";
        int i = r.update(sql, productId);
        return i > 0;
    } 
    public boolean addwanjuSeriesProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "INSERT INTO wanjuSeries_products (productId) VALUES (?)";
        int i = r.update(sql, productId);
        return i > 0;
    }
//i
    public boolean removewanjuSeriesProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "DELETE FROM wanjuSeries_products WHERE productId=?";
        int i = r.update(sql, productId);
        return i > 0;
    }

    public boolean addNewProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "INSERT INTO new_products (productId) VALUES (?)";
        int i = r.update(sql, productId);
        return i > 0;
    }

    public boolean removeNewProduct(String productId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "DELETE FROM new_products WHERE productId=?";
        int i = r.update(sql, productId);
        return i > 0;
    }

    public List<Product> getcantAffordSeriesProducts() throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT p.* FROM Product p INNER JOIN cantAffordSeries_products cp ON p.productId = cp.productId";
        return r.query(sql, new BeanListHandler<>(Product.class));
    }
    public List<Product> getnaifenSeriesProducts() throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT p.* FROM Product p INNER JOIN naifenSeries_products dp ON p.productId = dp.productId";
        return r.query(sql, new BeanListHandler<>(Product.class));
    }
    public List<Product> getphoneSeriesProducts() throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT p.* FROM Product p INNER JOIN phoneSeries_products pp ON p.productId = pp.productId";
        return r.query(sql, new BeanListHandler<>(Product.class));
    }
    public List<Product> getzhiniaokuSeriesProducts() throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT p.* FROM Product p INNER JOIN zhiniaokuSeries_products tp ON p.productId = tp.productId";
        return r.query(sql, new BeanListHandler<>(Product.class));
    }
    public List<Product> getweiyangSeriesProducts() throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT p.* FROM Product p INNER JOIN weiyangSeries_products wp ON p.productId = wp.productId";
        return r.query(sql, new BeanListHandler<>(Product.class));
    }
    public List<Product> getwanjuSeriesProducts() throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT p.* FROM Product p INNER JOIN wanjuSeries_products cp ON p.productId = cp.productId";
        return r.query(sql, new BeanListHandler<>(Product.class));
    }
    public List<Product> getHotProducts() throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT p.* FROM Product p INNER JOIN hot_products hp ON p.productId = hp.productId";
        return r.query(sql, new BeanListHandler<>(Product.class));
    }
    public List<Product> getNewProducts() throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT p.* FROM Product p INNER JOIN new_products np ON p.productId = np.productId";
        return r.query(sql, new BeanListHandler<>(Product.class));
    }

}
