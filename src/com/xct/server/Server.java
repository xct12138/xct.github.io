package com.xct.server;


import com.xct.loger.Loger;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * @author xct
 */
public class Server {
    public static void main(String[] args) {
        ServerSocket server;
        try {
            server=new ServerSocket(8181);
        } catch (IOException e) {
            Loger.exception(e);
            return;
        }
        try {
            Socket client = server.accept();
            Scheduling scheduling = new Scheduling(client.getInputStream(), client.getOutputStream());
            scheduling.start();
        } catch (IOException e) {
            Loger.exception(e);
        }
    }
}
