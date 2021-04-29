package com.xct.servlet;

import com.xct.server.MyServlet;
import com.xct.server.Request;
import com.xct.server.Response;
import com.xct.server.WebServlet;

/**
 * @author xct
 */
@WebServlet("/s1")
public class Servlet1 extends MyServlet {
    @Override
    public void service(Request request, Response response) {
        System.out.println("1进来了");
        response.writer("<h2>This is my first javaWeb script!</h2>");
    }
}
