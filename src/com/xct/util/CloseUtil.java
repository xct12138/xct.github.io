package com.xct.util;

import com.xct.loger.Loger;

import java.io.Closeable;
import java.io.IOException;

/**
 * @author xct
 */
public class CloseUtil {
    public static void close(Closeable... c){
        for (Closeable closeable : c) {
            try {
                closeable.close();
            } catch (IOException e) {
                Loger.exception(e);
            }
        }
    }
}
