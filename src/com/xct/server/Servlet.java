package com.xct.server;

/**
 * @author xct
 */
public interface Servlet {
    /**
     * 接受web请求，返回响应
     * @param request   请求
     * @param response  响应
     */
    void service(Request request,Response response);
}
