package service;

import model.Supplier;
import util.DBConnectionUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SupplierService {

    // By using a logger, developers can output informative messages, warnings, and error details during the execution of the application
    public static final Logger log = Logger.getLogger(SupplierService.class.getName());
    private static Connection connection;
    private static PreparedStatement preparedStatement;
    private static Statement statement;
    private static ResultSet resultSet;
    public static Supplier supplier;// public, because we can delete this supplier object
    private static int rowCount;

    public static int addSupplier(Supplier supplier) {
        try {
            connection = DBConnectionUtil.getDBConnection();
//            preparedStatement = connection.prepareStatement("INSERT INTO customers (firstName, lastName, userName, phone, email, password) VALUES (?,?,?,?,?,?)");
//            preparedStatement.setString(1, customer.getFirstName());
//            preparedStatement.setString(2, customer.getLastName());
//            preparedStatement.setString(6, customer.getUserName());
//            preparedStatement.setString(3, customer.getPhone());
//            preparedStatement.setString(4, customer.getEmail());
//            preparedStatement.setString(5, customer.getPassword());
//            rowCount = preparedStatement.executeUpdate();

            String sql = "INSERT INTO supplier (name, email, address, phone_number, product_category, password) VALUES ('"+ supplier.getName()+"', '"+ supplier.getEmail()+"', '"+ supplier.getAddress()+"', '"+ supplier.getPhone_number()+"', '"+ supplier.getProduct_category()+"', '"+ supplier.getPassword()+"')";

            statement = connection.createStatement();

            rowCount = statement.executeUpdate(sql);

        }
        catch (SQLException | ClassNotFoundException e) {
            log.log(Level.SEVERE, e.getMessage());
        }
        finally {
            /*
             * Close prepared statement and database connectivity at the end of
             * transaction
             */
            try {
                if(statement != null) {
                    statement.close();
                }
            }
            catch(SQLException e) {
                log.log(Level.SEVERE, e.getMessage());
            }
        }
        return rowCount;
    }

    public static Supplier getSupplier(int id) {

        try {
            connection = DBConnectionUtil.getDBConnection();
            preparedStatement = connection.prepareStatement("SELECT * FROM supplier WHERE id = ?");

            // set values
            preparedStatement.setInt(1, id);

            //execute query
            resultSet = preparedStatement.executeQuery();

            if(resultSet.next()) {
                // save data on model class
                supplier = new Supplier(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("address"),
                        resultSet.getString("phone_number"),
                        resultSet.getString("product_category"),
                        resultSet.getString("password")
                );

                System.out.println("after saved to model class -> id : "+supplier.getId());
            }

        }
        catch (SQLException | ClassNotFoundException e) {
            log.log(Level.SEVERE, e.getMessage());
        }
        finally {

            try {
                if(preparedStatement != null) {
                    preparedStatement.close();
                }
                if(connection != null) {
                    connection.close();
                }
            }
            catch(SQLException e) {
                log.log(Level.SEVERE, e.getMessage());
            }
        }

        // return result set to servlet page
        return supplier;
    }

    public static void fetchSupplier() {



    }

    public static int updateSupplier(Supplier supplier) {
        try {
            connection = DBConnectionUtil.getDBConnection();

            preparedStatement = connection.prepareStatement("UPDATE supplier SET name = ?, email = ?, address = ?, phone_number = ?, product_category = ?, password = ? WHERE id = ?");

            preparedStatement.setString(1, supplier.getName());
            preparedStatement.setString(2, supplier.getEmail());
            preparedStatement.setString(3, supplier.getAddress());
            preparedStatement.setString(4, supplier.getPhone_number());
            preparedStatement.setString(5, supplier.getProduct_category());
            preparedStatement.setString(6, supplier.getPassword());
            preparedStatement.setInt(7, supplier.getId());

            rowCount = preparedStatement.executeUpdate();
            System.out.println("Supplier ID " + supplier.getId());

            if(rowCount > 0) {
                System.out.println("Supplier Updated Successfully");
            }
            else {
                System.out.println("No Supplier found with ID " + supplier.getId());
            }

        }
        catch (Exception e) {
            System.err.println("Error updating supplier : " + e.getMessage());
        }

        return rowCount;
    }

    public static int deleteSupplier(int id) {
        try {
            connection = DBConnectionUtil.getDBConnection();

            preparedStatement = connection.prepareStatement("DELETE FROM supplier WHERE id = ?");

            preparedStatement.setInt(1, id);

            rowCount = preparedStatement.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("Error deleting supplier : " + e.getMessage());
        }

        return rowCount;
    }
}
