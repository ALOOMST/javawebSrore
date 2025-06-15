package bean;

public class Cart {
    private int cartId; 
    private int userId; 
    private String productId; 
    private int quantity; 

    public Cart() {
    	super();
    }

    public Cart(int userId, String productId, int quantity) {
    	super();
        this.userId = userId;
        this.productId = productId;
        this.quantity = quantity;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart [cartId=" + cartId + ", userId=" + userId + ", productId=" + productId + ", quantity=" + quantity + "]";
    }
}