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

@WebServlet("/getSupplier")
public class GetSupplierServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        System.out.println("get id : "+id);

        // save logged user data to model class
        Supplier supplier = SupplierService.getSupplier(id);

        if(supplier != null) {
            // create new session
            HttpSession session = request.getSession();
            session.setAttribute("email", supplier.getEmail());
            session.setAttribute("supplier", supplier);

            // set user object as an attribute in the request scope
            request.setAttribute("supplier", supplier);

            // forward to index.jsp page
            response.sendRedirect("pages/supplierUpdate.jsp");
        }
        else {
            System.out.println("supplier is null");
            response.sendRedirect("index.html");
        }

    }
}
