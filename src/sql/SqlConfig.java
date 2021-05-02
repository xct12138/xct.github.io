package sql;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class SqlConfig {
    public static String[] getLoginX() {
        String[] s = new String[3];
        Scanner scanner= null;
        try {
            scanner = new Scanner(new FileInputStream("src/sql/SqlLogin.conf"));
            int i=0;
            while (scanner.hasNext()){
                String s1 = scanner.nextLine();
                if (!"".equals(s1)){
                    s[i++]=s1;
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            s[0]="xct";
            s[1]="1234";
            s[2]="tdb1";
        }
        return s;
    }
}
