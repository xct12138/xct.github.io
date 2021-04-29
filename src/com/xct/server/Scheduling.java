package com.xct.server;

import com.xct.loger.Loger;
import com.xct.util.ServletStart;

import java.io.*;
import java.util.Scanner;

/**
 * servlet调度类
 * @author xct
 */
public class Scheduling {

    private static final PathTree SERVLET_TREE = new PathTree();

    private InputStream is;
    private OutputStream os;
    private String headFirst;

    public Scheduling(InputStream is, OutputStream os) {
        this.is = is;
        this.os = os;
    }

    private String getUri(){
        Scanner scanner=new Scanner(new InputStreamReader(is));
        headFirst = scanner.nextLine();
        System.out.println(headFirst);
        String[] s = headFirst.split(" ");
        String uri = "";
        if (s.length>2) {
            uri=s[1];
        }
        int index=uri.indexOf("?");
        uri=index>=0? uri.substring(0,index):uri;
        return uri;
    }
    public void start(){
        String[] uri = getUri().split("/");
        String[] uris;
        if (uri.length>1){
            uris = new String[uri.length - 1];
            for (int i = 1; i < uri.length; i++) {
                uris[i-1] = "/" + uri[i];
            }
        }else {
            uris = new String[]{"/main"};
        }
        String search = SERVLET_TREE.search(uris);
        System.out.println(search+"sear");
        if (!"".equals(search)){
            ServletStart.start(search,new Request(is),new Response(os));
        }else {
            ServletStart.start(SERVLET_TREE.search(new String[]{"/exception"}),new Request(is),new Response(os));
            Loger.log("输入错误");
        }
    }
}
