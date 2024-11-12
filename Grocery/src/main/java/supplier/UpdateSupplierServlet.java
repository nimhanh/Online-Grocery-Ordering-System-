package supplier;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Supplier;
import service.SupplierService;

import java.io.IOException;

@WebServlet("/update")
public class UpdateSupplierServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone_number = request.getParameter("phone_number");
        String product_category = request.getParameter("product_category");
        String password = request.getParameter("password");

        // save data to model class
        SupplierService.supplier.setId(id);
        SupplierService.supplier.setName(name);
        SupplierService.supplier.setEmail(email);
        SupplierService.supplier.setAddress(address);
        SupplierService.supplier.setPhone_number(phone_number);
        SupplierService.supplier.setProduct_category(product_category);
        SupplierService.supplier.setPassword(password);

        // add data to database
        int rowCount = SupplierService.updateSupplier(SupplierService.supplier);

        if(rowCount > 0) {
            // remove session
            HttpSession session = request.getSession();
            session.removeAttribute("email");
            response.sendRedirect("pages/supplierHome.jsp");
//            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        }
        else {
            // handle errors
            System.out.println("something wrong with data inserting to the database");
        }
    }
}
