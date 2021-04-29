package com.xct.server;

import java.lang.annotation.*;

/**
 * servlet的address
 * @author xct
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface WebServlet {
    String value();
}
