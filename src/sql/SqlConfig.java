package sql;

import java.util.Objects;
import java.util.Scanner;

public class SqlConfig {
    public static String[] getLoginX() {
        String[] s = new String[3];
        Scanner scanner;
        try {
            scanner = new Scanner(Objects.requireNonNull(SqlConfig.class.getClassLoader().getResourceAsStream("sql\\SqlLogin.conf")));
            int i=0;
            while (scanner.hasNext()){
                String s1 = scanner.nextLine();
                if (!"".equals(s1)){
                    s[i++]=s1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }
}
