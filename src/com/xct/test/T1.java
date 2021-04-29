package com.xct.test;

import com.xct.loger.Loger;
import com.xct.server.MyServlet;
import com.xct.server.Request;
import com.xct.server.Response;

import java.io.File;


/**
 * @author xct
 */
public class T1 {
    public static void main(String[] args) {

    }
    private static String getClassName(String classPath){
        String path=classPath.replace('\\','.');
        path=path.substring(path.indexOf(".")+1,path.lastIndexOf("."));
        return path;
    }
}
