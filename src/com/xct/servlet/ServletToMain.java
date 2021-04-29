package com.xct.servlet;

import com.xct.server.MyServlet;
import com.xct.server.Request;
import com.xct.server.Response;
import com.xct.server.WebServlet;

/**
 * @author xct
 */
@WebServlet("/main")
public class ServletToMain extends MyServlet {
    @Override
    public void service(Request request, Response response) {
        System.out.println("Main");
    }
}
