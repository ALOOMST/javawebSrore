/*package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.util.List;
import bean.Product;
import bean.Cart;
import service.ProductService;
import service.CartService;

@WebServlet("/ProductServlet")
@MultipartConfig // 启用文件上传
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ProductService productService = new ProductService();
    private final CartService cartService = new CartService();
    private static final String UPLOAD_DIR = "uploads"; // 上传目录

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            String productId = request.getParameter("productId");
            Product product = productService.getProductById(productId);
            if (product == null) {
                response.sendRedirect("admin.jsp?error=productNotFound");
                return;
            }
            request.setAttribute("product", product);
            request.getRequestDispatcher("editProduct.jsp").forward(request, response);
        } else if ("deleteInfo".equals(action)) { // 修改为删除商品信息的操作
            String productId = request.getParameter("productId");
            String deleteField = request.getParameter("deleteField"); // 新增参数，指定要删除的字段
            try {
                Product product = productService.getProductById(productId);
                if (product != null) {
                    if ("productName".equals(deleteField)) {
                        // 如果删除商品名字，则删除整个商品
                        boolean success = productService.deleteProduct(productId);
                        if (success) {
                            response.sendRedirect("admin.jsp");
                        } else {
                            response.sendRedirect("admin.jsp?error=deleteFailed");
                        }
                    } else {
                        // 删除指定字段
                        if ("price".equals(deleteField)) {
                            product.setPrice(0); // 将价格设置为0
                        } else if ("stock".equals(deleteField)) {
                            product.setStock("0"); // 将库存设置为0
                        } else if ("imagepath".equals(deleteField)) {
                            product.setImagepath(""); // 清空图片路径
                        }
                        boolean success = productService.updateProduct(product);
                        if (success) {
                            response.sendRedirect("admin.jsp");
                        } else {
                            response.sendRedirect("admin.jsp?error=updateFailed");
                        }
                    }
                } else {
                    response.sendRedirect("admin.jsp?error=productNotFound");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("admin.jsp?error=updateFailed");
            }
        } else if ("addHot".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.addHotProduct(productId);
            if (success) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("admin.jsp?error=addHotFailed");
            }
        } else if ("removeHot".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.removeHotProduct(productId);
            if (success) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("admin.jsp?error=removeHotFailed");
            }
        } else if ("addNew".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.addNewProduct(productId);
            if (success) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("admin.jsp?error=addNewFailed");
            }
        } else if ("removeNew".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.removeNewProduct(productId);
            if (success) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("admin.jsp?error=removeNewFailed");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            Part filePart = request.getPart("imagePath"); // 获取上传的文件
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR + File.separator + fileName;
            File uploadDir = new File(getServletContext().getRealPath("") + File.separator + UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdir(); // 创建上传目录
            }
            filePart.write(uploadPath); // 保存文件到服务器

            String productName = request.getParameter("productName");
            double price = Double.parseDouble(request.getParameter("price"));
            String stock = request.getParameter("stock");
            String imagePath = UPLOAD_DIR + File.separator + fileName;

            Product product = new Product(productName, price, stock, imagePath);
            boolean success = productService.addProduct(product);
            if (success) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("admin.jsp?error=addFailed");
            }
        } else if ("update".equals(action)) {
            String productId = request.getParameter("productId");
            String productName = request.getParameter("productName");
            double price = Double.parseDouble(request.getParameter("price"));
            String stock = request.getParameter("stock");

            Part filePart = request.getPart("imagePath");
            String fileName = filePart.getSubmittedFileName();
            String imagePath = "";
            if (fileName != null && !fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR + File.separator + fileName;
                File uploadDir = new File(getServletContext().getRealPath("") + File.separator + UPLOAD_DIR);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir(); // 创建上传目录
                }
                filePart.write(uploadPath); // 保存文件到服务器
                imagePath = UPLOAD_DIR + File.separator + fileName;
            }

            Product product = productService.getProductById(productId);
            if (product == null) {
                response.sendRedirect("admin.jsp?error=productNotFound");
                return;
            }
            product.setProductName(productName);
            product.setPrice(price);
            product.setStock(stock);
            product.setImagepath(imagePath);

            boolean success = productService.updateProduct(product);
            if (success) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("admin.jsp?error=updateFailed");
            }
        } else if ("search".equals(action)) {
            String keyword = request.getParameter("keyword");
            List<Product> productList = productService.searchProducts(keyword);
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if ("addCart".equals(action)) {
            String productId = request.getParameter("productId");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int userId = (Integer) request.getSession().getAttribute("userId");

            Product product = productService.getProductById(productId);
            if (product == null) {
                response.sendRedirect("index.jsp?error=productNotFound");
                return;
            }

            Cart cartItem = new Cart(userId, product.getProductId(), quantity);
            boolean success = cartService.addToCart(cartItem);
            if (success) {
                response.sendRedirect("cart.jsp");
            } else {
                response.sendRedirect("index.jsp?error=addFailed");
            }
        }
    }
}*/
package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.util.List;
import bean.Product;
import bean.Cart;
import service.ProductService;
import service.CartService;

@WebServlet("/ProductServlet")
@MultipartConfig // 启用文件上传
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ProductService productService = new ProductService();
    private final CartService cartService = new CartService();
    private static final String UPLOAD_DIR = ""; // 上传目录

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            String productId = request.getParameter("productId");
            Product product = productService.getProductById(productId);
            if (product == null) {
                response.sendRedirect("admin.jsp?error=productNotFound");
                return;
            }
            request.setAttribute("product", product);
            request.getRequestDispatcher("editProduct.jsp").forward(request, response);
        } else if ("deleteInfo".equals(action)) {
            String productId = request.getParameter("productId");
            String deleteField = request.getParameter("deleteField");
            try {
                Product product = productService.getProductById(productId);
                if (product != null) {
                    if ("productName".equals(deleteField)) {
                        boolean success = productService.deleteProduct(productId);
                        if (success) {
                            response.sendRedirect("admin.jsp");
                        } else {
                            response.sendRedirect("admin.jsp?error=deleteFailed");
                        }
                    } else {
                        if ("price".equals(deleteField)) {
                            product.setPrice(0);
                        } else if ("stock".equals(deleteField)) {
                            product.setStock("0");
                        } else if ("imagepath".equals(deleteField)) {
                            product.setImagepath("");
                        } else if ("descrition".equals(deleteField)) {
                            product.setDescrition("null");
                        }
                        boolean success = productService.updateProduct(product);
                        if (success) {
                            response.sendRedirect("admin.jsp");
                        } else {
                            response.sendRedirect("admin.jsp?error=updateFailed");
                        }
                    }
                } else {
                    response.sendRedirect("admin.jsp?error=productNotFound");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("admin.jsp?error=updateFailed");
            }
        } else if ("addHot".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.addHotProduct(productId);
            if (success) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("admin.jsp?error=addHotFailed");
            }
        } else if ("removeHot".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.removeHotProduct(productId);
            if (success) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("admin.jsp?error=removeHotFailed");
            }
        } else if ("addNew".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.addNewProduct(productId);
            if (success) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("admin.jsp?error=addNewFailed");
            }
        } else if ("removeNew".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.removeNewProduct(productId);
            if (success) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("admin.jsp?error=removeNewFailed");
            }
        } else if ("addCart".equals(action)) {
            String productId = request.getParameter("productId");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int userId = (Integer) request.getSession().getAttribute("userId");

            Product product = productService.getProductById(productId);
            if (product == null) {
                response.sendRedirect("index.jsp?error=productNotFound");
                return;
            }

            if (quantity > Integer.parseInt(product.getStock())) {
                response.sendRedirect("index.jsp?error=stockNotEnough");
                return;
            }

            Cart cartItem = new Cart(userId, product.getProductId(), quantity);
            boolean success = cartService.addToCart(cartItem);
            if (success) {
                response.sendRedirect("cart.jsp");
            } else {
                response.sendRedirect("index.jsp?error=addFailed");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            Part filePart = request.getPart("imagePath");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR + File.separator + fileName;
            File uploadDir = new File(getServletContext().getRealPath("") + File.separator + UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            filePart.write(uploadPath);

            String productName = request.getParameter("productName");
            double price = Double.parseDouble(request.getParameter("price"));
            String stock = request.getParameter("stock");
            String imagePath = UPLOAD_DIR + File.separator + fileName;
            String descrition = request.getParameter("descrition");

            Product product = new Product(productName, price, stock, imagePath, descrition);
            boolean success = productService.addProduct(product);
            if (success) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("admin.jsp?error=addFailed");
            }
        } else if ("update".equals(action)) {
            String productId = request.getParameter("productId");
            String productName = request.getParameter("productName");
            double price = Double.parseDouble(request.getParameter("price"));
            String stock = request.getParameter("stock");
            String descrition = request.getParameter("descrition");

            Part filePart = request.getPart("imagePath");
            String fileName = filePart.getSubmittedFileName();
            String imagePath = "";
            if (fileName != null && !fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR + File.separator + fileName;
                File uploadDir = new File(getServletContext().getRealPath("") + File.separator + UPLOAD_DIR);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                filePart.write(uploadPath);
                imagePath = UPLOAD_DIR + File.separator + fileName;
            }

            Product product = productService.getProductById(productId);
            if (product == null) {
                response.sendRedirect("admin.jsp?error=productNotFound");
                return;
            }
            product.setProductName(productName);
            product.setPrice(price);
            product.setStock(stock);
            product.setImagepath(imagePath);
            product.setDescrition(descrition);

            boolean success = productService.updateProduct(product);
            if (success) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("admin.jsp?error=updateFailed");
            }
        } else if ("search".equals(action)) {
            String keyword = request.getParameter("keyword");
            List<Product> productList = productService.searchProducts(keyword);
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if ("addCart".equals(action)) {
            String productId = request.getParameter("productId");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int userId = (Integer) request.getSession().getAttribute("userId");

            Product product = productService.getProductById(productId);
            if (product == null) {
                response.sendRedirect("index.jsp?error=productNotFound");
                return;
            }

            if (quantity > Integer.parseInt(product.getStock())) {
                response.sendRedirect("index.jsp?error=stockNotEnough");
                return;
            }

            Cart cartItem = new Cart(userId, product.getProductId(), quantity);
            boolean success = cartService.addToCart(cartItem);
            if (success) {
                response.sendRedirect("cart.jsp");
            } else {
                response.sendRedirect("index.jsp?error=addFailed");
            }
        }
    }
}