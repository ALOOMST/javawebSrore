package bean;

public class Orderdetail {

	 private int orderdetailid;
	    private String orderid;
	    private String productid;
	    private String quantity;
	    private String unitprice;
	    
		public Orderdetail(int orderdetailid, String orderid, String productid, String quantity, String unitprice) {
			super();
			this.orderdetailid = orderdetailid;
			this.orderid = orderid;
			this.productid = productid;
			this.quantity = quantity;
			this.unitprice = unitprice;
		}

		public Orderdetail() {
			super();
			
		}
		
		public Orderdetail(String orderid, String productid, String quantity, String unitprice) {
			super();
			this.orderid = orderid;
			this.productid = productid;
			this.quantity = quantity;
			this.unitprice = unitprice;
		}

		public int getOrderdetailid() {
			return orderdetailid;
		}

		public void setOrderdetailid(int orderdetailid) {
			this.orderdetailid = orderdetailid;
		}

		public String getOrderid() {
			return orderid;
		}

		public void setOrderid(String orderid) {
			this.orderid = orderid;
		}

		public String getProductid() {
			return productid;
		}

		public void setProductid(String productid) {
			this.productid = productid;
		}

		public String getQuantity() {
			return quantity;
		}

		public void setQuantity(String quantity) {
			this.quantity = quantity;
		}

		public String getUnitprice() {
			return unitprice;
		}

		public void setUnitprice(String unitprice) {
			this.unitprice = unitprice;
		}

		@Override
		public String toString() {
			return "Orderdetail [orderdetailid=" + orderdetailid + ", orderid=" + orderid + ", productid=" + productid
					+ ", quantity=" + quantity + ", unitprice=" + unitprice + "]";
		}
		
		
}

