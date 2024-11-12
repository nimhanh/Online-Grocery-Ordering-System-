package supplier;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.SupplierService;

import java.io.IOException;

@WebServlet("/delete")
public class DeleteSupplierServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        // delete customer
        int rowCount = SupplierService.deleteSupplier(id);

        if(rowCount > 0) {
            // remove session
            HttpSession session = request.getSession();
            session.removeAttribute("email");
            session.removeAttribute("supplier");
            SupplierService.supplier = null;

            // Redirect back to the login page
            response.sendRedirect("index.html");
        }
        else {
            System.out.println("Supplier deletion failed");
        }
    }
}
