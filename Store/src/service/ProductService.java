package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Product;
import dao.ProductDao;

public class ProductService {
    private final ProductDao productDao = new ProductDao();

    public List<Product> getAllProducts() {
        try {
            return productDao.getAllProducts();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean addProduct(Product product) {
        try {
            return productDao.addProduct(product);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateProduct(Product product) {
        try {
            return productDao.updateProduct(product);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteProduct(String productId) {
        try {
            return productDao.deleteProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Product> searchProducts(String keyword) {
        try {
            return productDao.searchProducts(keyword);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public Product getProductById(String productId) {
        try {
            return productDao.getProductById(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean addHotProduct(String productId) {
        try {
            return productDao.addHotProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removeHotProduct(String productId) {
        try {
            return productDao.removeHotProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addNewProduct(String productId) {
        try {
            return productDao.addNewProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removeNewProduct(String productId) {
        try {
            return productDao.removeNewProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addcantAffordSeriesProduct(String productId) {
        try {
            return productDao.addcantAffordSeriesProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removecantAffordSeriesProduct(String productId) {
        try {
            return productDao.removecantAffordSeriesProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean addnaifenSeriesProduct(String productId) {
        try {
            return productDao.addnaifenSeriesProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removenaifenSeriesProduct(String productId) {
        try {
            return productDao.removenaifenSeriesProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean addphoneSeriesProduct(String productId) {
        try {
            return productDao.addphoneSeriesProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removephoneSeriesProduct(String productId) {
        try {
            return productDao.removephoneSeriesProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean addzhiniaokuSeriesProduct(String productId) {
        try {
            return productDao.addzhiniaokuSeriesProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removezhiniaokuSeriesProduct(String productId) {
        try {
            return productDao.removezhiniaokuSeriesProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean addweiyangSeriesProduct(String productId) {
        try {
            return productDao.addweiyangSeriesProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removeweiyangSeriesProduct(String productId) {
        try {
            return productDao.removeweiyangSeriesProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    //i
    public boolean addwanjuSeriesProduct(String productId) {
        try {
            return productDao.addwanjuSeriesProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removewanjuSeriesProduct(String productId) {
        try {
            return productDao.removewanjuSeriesProduct(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Product> getHotProducts() {
    	try {
            List<Product> products = productDao.getHotProducts();
            return products != null ? products : new ArrayList<>();
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>(); 
        }
    }

    public List<Product> getNewProducts() {
    	try {
            List<Product> products = productDao.getNewProducts();
            return products != null ? products : new ArrayList<>(); 
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>(); 
        }
    } 
    public List<Product> getcantAffordSeriesProducts() {
    	try {
            List<Product> products = productDao.getNewProducts();
            return products != null ? products : new ArrayList<>(); 
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>(); 
        }
    } 
    public List<Product> getnaifenSeriesProducts() {
        try {
            return productDao.getnaifenSeriesProducts();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    } 
    public List<Product> getphoneSeriesProducts() {
        try {
            return productDao.getphoneSeriesProducts();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    } 
    
    public List<Product> getzhiniaokuSeriesProducts() {
        try {
            return productDao.getzhiniaokuSeriesProducts();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    } 
    
    public List<Product> getweiyangSeriesProducts() {
        try {
            return productDao.getweiyangSeriesProducts();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    } 
    
    public List<Product> getwanjuSeriesProducts() {
    	try {
            List<Product> products = productDao.getwanjuSeriesProducts();
            return products != null ? products : new ArrayList<>(); 
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>(); 
        }
    } 
    
}

   

