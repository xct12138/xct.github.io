package com.xct.util;

import com.xct.loger.Loger;
import com.xct.server.MyServlet;
import com.xct.server.Request;
import com.xct.server.Response;

/**
 * @author xct
 */
public class ServletStart {
    public static void start(String className,Request request,Response response){
        try {
            Class<?extends MyServlet> servlet = (Class<? extends MyServlet>) Class.forName(className);
            MyServlet servlet1 = servlet.newInstance();
            servlet.getMethod("service", Request.class, Response.class).invoke(servlet1,request,response);
        } catch (Exception e) {
            //Loger.exception(e);
        }
    }
}
