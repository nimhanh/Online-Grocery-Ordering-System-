package supplier;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Supplier;
import service.SupplierService;

import java.io.IOException;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone_number = request.getParameter("phone_number");
        String product_category = request.getParameter("product_category");
        String password = request.getParameter("password");

        // save data to model class
        Supplier supplier = new Supplier();
        supplier.setName(name);
        supplier.setEmail(email);
        supplier.setAddress(address);
        supplier.setPhone_number(phone_number);
        supplier.setProduct_category(product_category);
        supplier.setPassword(password);

        // add data to database
        int rowCount = SupplierService.addSupplier(supplier);

        if(rowCount > 0) {
            // new customer added successfully
            response.sendRedirect("pages/supplierLogin.jsp");
        }
        else {
            // handle errors
            System.out.println("something wrong with data inserting to the database");
        }
    }
}