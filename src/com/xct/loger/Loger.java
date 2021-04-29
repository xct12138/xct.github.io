package com.xct.loger;

import com.xct.util.CloseUtil;
import java.io.*;
import java.util.Date;

/**
 * @author xct
 */
public class Loger {
    private static final File FATHER_PATH =new File("src/com/xct/log");
    private static final long LOG_FILE_MAXLENGTH=64*1024*1024;
    private static final String CRLF="\r\n";
    private static int id;
    private static Writer writer;

    private Loger(){
    }

    private static void openLog(){
        writer=new OutputStreamWriter(openOutStream());
    }

    private static boolean idFileIsEnable(int id){
        File file=new File(FATHER_PATH,"log"+id+".txt");
        if (file.exists()) {
                return file.length()<LOG_FILE_MAXLENGTH;
        }
        return true;
    }

    private static String getEnableFileName(){
        if (!idFileIsEnable(Loger.id)){
            id++;
        }
        return "log"+id+".log";
    }

    private static OutputStream openOutStream(){
        OutputStream os=null;
        File logFile = new File(FATHER_PATH, getEnableFileName());
        try {
            if (!logFile.exists()) {
                logFile.createNewFile();
            }
            os = new FileOutputStream(logFile,true);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return os;
    }

    private static void writeLog(String s){
        openLog();
        try {
            writer.write(s + "\t" + new Date(System.currentTimeMillis()).toString() + CRLF);
        } catch (IOException e) {
            e.printStackTrace();
        }
        close();
    }

    private static void close(){
        CloseUtil.close(writer);
    }

    public static void log(String l){
        writeLog(l);
    }

    public static void exception(String ex){
        int index=ex.indexOf("\n");
        if (index>=0) {
            log(ex.substring(index));
        }else {
            log(ex);
        }
    }

    public static void exception(Exception ex){
        exception(ex.getMessage());
    }
}
