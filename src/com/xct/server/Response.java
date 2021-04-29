package com.xct.server;

import com.xct.loger.Loger;

import java.io.IOException;
import java.io.OutputStream;

/**
 * @author xct
 */
public class Response {
    private OutputStream os;
    private long length;


    public Response(OutputStream os) {
        this.os = os;
    }
    public void writer(String msg){
        try {
            String d="HTTP/1.1 200\n" +
                "Content-Type: text/html;charset=utf-8\n" +
                "Content-Length: "+msg.getBytes().length+"\n" +
                "Date: Tue, 19 Jan 2021 11:32:09 GMT\n" +
                "Keep-Alive: timeout=20\n" +
                "Connection: keep-alive\n\n";
            os.write((d+msg).getBytes());
            os.close();
        } catch (IOException e) {
            Loger.exception(e);
            try {
                os.close();
            } catch (IOException ioException) {
                Loger.exception(ioException);
            }
        }
    }
}
