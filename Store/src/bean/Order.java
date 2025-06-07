package bean;

public class Order {
    private int orderid;
    private String userid;
    private String orderdate;
    private String totalamount;
    private String orderstatus;
    private String shippingaddress;
    
    public Order(int orderid, String userid, String orderdate, String totalamount, String orderstatus, String shippingaddress) {
        super();
        this.orderid = orderid;
        this.userid = userid;
        this.orderdate = orderdate;
        this.totalamount = totalamount;
        this.orderstatus = orderstatus;
        this.shippingaddress = shippingaddress;
    }

    public Order() {
        super();
    }
    
    public Order(String userid, String orderdate, String totalamount, String orderstatus, String shippingaddress) {
        super();
        this.userid = userid;
        this.orderdate = orderdate;
        this.totalamount = totalamount;
        this.orderstatus = orderstatus;
        this.shippingaddress = shippingaddress;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }

    public String getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(String totalamount) {
        this.totalamount = totalamount;
    }

    public String getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(String orderstatus) {
        this.orderstatus = orderstatus;
    }

    public String getShippingaddress() {
        return shippingaddress;
    }

    public void setShippingaddress(String shippingaddress) {
        this.shippingaddress = shippingaddress;
    }

    @Override
    public String toString() {
        return "Order [orderid=" + orderid + ", userid=" + userid + ", orderdate=" + orderdate + ", totalamount=" + totalamount + ", orderstatus=" + orderstatus + ", shippingaddress=" + shippingaddress + "]";
    }
}
