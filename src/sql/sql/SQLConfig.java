package sql.sql;

import java.util.Objects;
import java.util.Scanner;

public class SQLConfig {
    public static String[] getLoginConfig(){
        String[] conf = new String[3];
        try {
            Scanner scanner=new Scanner(Objects.requireNonNull(SQLConfig.class.getClassLoader().getResourceAsStream("./dbLogin.conf")));
            String s;
            for (int i = 0; i < conf.length && scanner.hasNext(); i++) {
                s= scanner.nextLine();
                if (!"".equals(s)){
                    conf[i] = s;
                }
            }

        } catch (Exception e) {
            System.out.println("SQL登录配置文件读取失败！！！");
            e.printStackTrace();
            return new String[]{"xct", "1234", "test1"};
        }
        return conf;
    }
}
