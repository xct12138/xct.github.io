package com.xct.server;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Scanner;

/**
 * @author xct
 */
public class Request {
    private Scanner scanner;
    private String method;
    private String uri;
    private String html;

    public Request(InputStream is) {
        this.scanner = new Scanner(new InputStreamReader(is));
        get();
    }

    private void get(){
/*
        String[] msg = scanner.nextLine().split(" ");
        method=msg[0];
        if (msg.length > 2) {
            uri = msg[1];
            html = msg[2];
        } else {
            uri = "";
            html = msg[1];
        }*/
    }

    public String getMethod(){
        return method;
    }

    public String getHtml() {
        return html;
    }
    public String getUri() {
        return uri;
    }
}
