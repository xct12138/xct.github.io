package util;

public class Close {
    public static void close(Object ...objs){
        try {
            for ( Object obj : objs) {
                if (obj instanceof AutoCloseable) ((AutoCloseable)obj).close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
