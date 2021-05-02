package sql;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class SqlConfig {
    public static String[] getLoginX() throws FileNotFoundException {
        String[] s = new String[3];
        Scanner scanner=new Scanner(new FileInputStream("SqlLogin.conf"));
        int i=0;
        while (scanner.hasNext()){
            String s1 = scanner.nextLine();
            if (!"".equals(s1)){
                s[i++]=s1;
            }
        }
        return s;
    }
}
