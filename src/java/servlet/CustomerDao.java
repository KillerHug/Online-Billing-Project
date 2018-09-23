package servlet;

import java.io.IOException;
import java.sql.*;


public class CustomerDao {

    public static String save(CustomerBean bean) throws SQLException, IOException {
        
        int status = 0;
        
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
        try {
            PreparedStatement ps = con.prepareStatement("insert into customer values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,seq_srno.nextval)");
            ps.setString(1, bean.getName());
            ps.setDate(2, bean.getDob());
            ps.setString(3, bean.getGender());
            ps.setString(4, bean.getEmp());
            ps.setString(5, bean.getMarital());
            ps.setString(6, bean.getEmail());
            ps.setLong(7, bean.getMobile());
            ps.setString(8, bean.getAddress());
            ps.setString(9, bean.getCity());
            ps.setString(10, bean.getState());
            ps.setString(11, bean.getCountry());
            ps.setString(12, bean.getNational());
            ps.setString(13, bean.getUserid());
            ps.setString(14, bean.getPassword());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                return "true";
            } else {
                return "false";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
    }

    public static String payment(PaymentBean bean) throws SQLException {
        int status = 0;
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
        try {
            PreparedStatement ps = con.prepareStatement("insert into payment values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,seq_reference.nextval)");
            ps.setString(1, bean.getState());
            ps.setString(2, bean.getType());
            ps.setLong(3, bean.getConsumer());
            ps.setString(4, bean.getProvider());
            ps.setString(5, bean.getEmail());
            ps.setLong(6, bean.getMobile());
            ps.setDouble(7, bean.getPayment());
            ps.setString(8, bean.getOption());
            ps.setLong(9, bean.getCardno());
            ps.setString(10, bean.getCardname());
            ps.setString(11, bean.getCardtype());
            ps.setString(12, bean.getCarddate());
            ps.setLong(13, bean.getCvv());
            ps.setDouble(14, bean.getPaid());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return "true";
            } else {
                return "false";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
    }
    public static String update(CustomerBean bean) throws SQLException, IOException {
        
        int status = 0;
        
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
        try {
            PreparedStatement ps = con.prepareStatement("update customer set name=?,dob=?,gender=?,email=?,mobile=? where srno=?");
            ps.setString(1, bean.getUname());
            ps.setDate(2, bean.getUdob());
            ps.setString(3, bean.getUgender());
            ps.setString(4, bean.getUemail());
            ps.setLong(5, bean.getUmobile()); 
            ps.setLong(6, bean.getUid()); 
            ResultSet rs = ps.executeQuery();
            System.out.println(bean.getUid());
            if (rs.next()) {

                return "true";
            } else {
                return "false";
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "error";
    }

}
