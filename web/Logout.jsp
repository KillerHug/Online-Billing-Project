<%
    //session.invalidate();   
    session.setAttribute("userid",null);
    //request.setAttribute("logout","You are Sucessfully logged out...");
    response.sendRedirect("CustomerLogIn.jsp");
    response.setHeader("Cache-Control", "no-store"); //HTTP 1.1 
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>