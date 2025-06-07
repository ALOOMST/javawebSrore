package bean;

public class Product {
    private String productId;
    private String productName;
    private double price;
    private String stock;
    private String imagepath;
    private String descrition;

    
    
    public Product(String productName, double price, String stock, String imagepath, String descrition) {
		super();
		this.productId = "default";
		this.productName = productName;
		this.price = price;
		this.stock = stock;
		this.imagepath = imagepath;
		this.descrition = descrition;
		
	}

	public Product() {
    	super();
    }

    public Product(String productId, String productName, double price, String stock, String imagepath, String descrition,String categoryId) {
    	super();
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.stock = stock;
        this.imagepath = imagepath;
        this.descrition = descrition;
   
    }

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}
	
	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public String getDescrition() {
		return descrition;
	}

	public void setDescrition(String descrition) {
		this.descrition = descrition;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", price=" + price + ", stock="
				+ stock + ", imagepath=" + imagepath + ", descrition=" + descrition + "]";
	}
}