package dao.io;

import util.Close;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

public class ReadText {
    private File textPath;
    private Scanner scanner=null;

    public void setTextPath(String textPath) {
        this.textPath=new File(textPath);
    }

    public ReadText() {
    }

    public ReadText(String path){
        textPath=new File(path);
        try {
            scanner=new Scanner(textPath,"UTF-8");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public String readLine(){
        String string=null;
        if (scanner.hasNext()){
            string=scanner.nextLine();
        }
        return string;
    }
    public String readSegment(long first,long len){
        String string=null;
        InputStream inputStream=null;
        try {
            inputStream = new FileInputStream(textPath);
            byte[] bytes = new byte[(int) len];
            int i;
            if (first!= inputStream.skip(first)){
                inputStream.reset();
            }
            i= inputStream.read(bytes);
            if (i>0)string=new String(bytes, StandardCharsets.UTF_8);
            else string="";
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            Close.close(inputStream);
        }
        return string;
    }
    public String readAll(){
        long length = textPath.length();

        return readSegment(0,length);
    }
}
