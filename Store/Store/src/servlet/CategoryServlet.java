/*package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Category;
import service.CategoryService;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CategoryService categoryService = new CategoryService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            String categoryId = request.getParameter("categoryId");
            Category category = categoryService.getCategoryById(categoryId);
            if (category != null) {
                request.setAttribute("category", category);
                request.getRequestDispatcher("editCategory.jsp").forward(request, response);
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=categoryNotFound");
            }
        } else if ("delete".equals(action)) {
            String categoryId = request.getParameter("categoryId");
            boolean success = categoryService.deleteCategory(categoryId);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=deleteFailed");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String categoryName = request.getParameter("categoryName");
            Category category = new Category();
            category.setCategoryName(categoryName);
            boolean success = categoryService.addCategory(category);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=addFailed");
            }
        } else if ("update".equals(action)) {
            String categoryId = request.getParameter("categoryId");
            String categoryName = request.getParameter("categoryName");
            Category category = new Category(categoryId, categoryName);
            boolean success = categoryService.updateCategory(category);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=updateFailed");
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

@WebServlet("/CategoryServlet")
@MultipartConfig // 启用文件上传
public class CategoryServlet extends HttpServlet {
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
                response.sendRedirect("adminCategoryManagement.jsp?error=productNotFound");
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
                            response.sendRedirect("adminCategoryManagement.jsp");
                        } else {
                            response.sendRedirect("adminCategoryManagement.jsp?error=deleteFailed");
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
                            response.sendRedirect("adminCategoryManagement.jsp");
                        } else {
                            response.sendRedirect("adminCategoryManagement.jsp?error=updateFailed");
                        }
                    }
                } else {
                    response.sendRedirect("adminCategoryManagement.jsp?error=productNotFound");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("adminCategoryManagement.jsp?error=updateFailed");
            }
        } else if ("addcantAffordSeries".equals(action)) {/////
            String productId = request.getParameter("productId");
            boolean success = productService.addcantAffordSeriesProduct(productId);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=addcantAffordSeriesFailed");
            }
        } else if ("removecantAffordSeries".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.removecantAffordSeriesProduct(productId);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=removecantAffordSeriesFailed");
            }
        }else if ("addnaifenSeries".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.addnaifenSeriesProduct(productId);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=addnaifenSeriesFailed");
            }
        } else if ("removenaifenSeries".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.removenaifenSeriesProduct(productId);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=removenaifenSeriesFailed");
            }
        } else if ("addzhiniaokuSeries".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.addzhiniaokuSeriesProduct(productId);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=addzhiniaokuSeriesFailed");
            }
        } else if ("removezhiniakuSeries".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.removezhiniaokuSeriesProduct(productId);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=removezhiniaokuSeriesFailed");
            }
        } else if ("addweiyangSeries".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.addweiyangSeriesProduct(productId);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=addwrisrbandSeriesFailed");
            }
        } else if ("removeweiyangSeries".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.removeweiyangSeriesProduct(productId);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=removeweiyangSeriesFailed");
            }
        } else if ("addwanjuSeries".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.addwanjuSeriesProduct(productId);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=addwanjuSeriesFailed");
            }
        } else if ("removewanjuSeries".equals(action)) {
            String productId = request.getParameter("productId");
            boolean success = productService.removewanjuSeriesProduct(productId);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=removewanjurSeriesFailed");
            }
        }   
        else if ("addCart".equals(action)) {
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
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=addFailed");
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
                response.sendRedirect("adminCategoryManagement.jsp?error=productNotFound");
                return;
            }
            product.setProductName(productName);
            product.setPrice(price);
            product.setStock(stock);
            product.setImagepath(imagePath);
            product.setDescrition(descrition);

            boolean success = productService.updateProduct(product);
            if (success) {
                response.sendRedirect("adminCategoryManagement.jsp");
            } else {
                response.sendRedirect("adminCategoryManagement.jsp?error=updateFailed");
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
