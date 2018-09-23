<%@page import="servlet.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="java.sql.*" %>
<%
    try {
        response.setContentType("text/html");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
        PreparedStatement ps = con.prepareStatement("select name,dob, emp,marital,email,mobile,srno from customer");
        ResultSet rs = ps.executeQuery();
        ResultSetMetaData rsmd = rs.getMetaData();
        int total = rsmd.getColumnCount();
%>
<html>
    <head>
        <style>
            table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: 1px solid #ddd;
}

            #table_style {font-family:Trebuchet MS, Arial, Helvetica, sans-serif;border-collapse: collapse;width: 100%;}
            #table_style td, #customers th {border: 1px solid #ddd; padding: 8px; size: 1px;}       
            #table_style tr:nth-child(even){background-color: whitesmoke;}
            #table_style tr:hover {background-color: #ddd;}
            #table_style th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: black;
                color: white;
            </style>
        </head>
        <body>
            <div style="overflow-x:auto;">
                <table border='1' id='table_style'>
                    <tr>
                        <%
                            for (int i = 1; i <= total; i++) {
                                out.print("<th>" + rsmd.getColumnName(i) + "</th>");
                        }%>
                    </tr>
                    <%
                    while (rs.next()) {%>
                    <tr>
                        <td>
                            <%= rs.getString(1)%>
                        </td>
                        <td>
                            <%= rs.getDate(2)%>
                        </td>
                        <td>
                            <%= rs.getString(3)%>
                        </td>
                        <td>
                            <%= rs.getString(4)%>
                        </td>
                        <td>
                            <%= rs.getString(5)%>
                        </td>
                        <td>
                            <%= rs.getString(6)%>
                        </td>
                        <td>
                            <%= rs.getLong(7)%>
                        </td>
                        
                    </tr>                                         
                    <%}
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                </table>
            </div>
        </body>
    </html>
