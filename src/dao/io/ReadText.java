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
            scanner=new Scanner(new FileInputStream(textPath));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public String readLine(){
        String string=null;
        if (scanner.hasNext()) string=scanner.nextLine();
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
            Close.close(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            Close.close(inputStream);
        }
        return string;
    }
    public String readAll(){
        StringBuilder string=new StringBuilder();
        Reader reader=null;
        try {
            reader = new FileReader(textPath);
            int i;
            do {
                i = reader.read();
                string.append(i);
            }while (i!=-1);
            Close.close(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            Close.close(reader);
        }
        return string.toString();
    }
}
