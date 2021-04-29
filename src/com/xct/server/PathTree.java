package com.xct.server;

import com.xct.loger.Loger;

import java.io.File;
import java.util.HashMap;

/**
 * servlet 路径树
 * @author xct
 */
public class PathTree {
    private final File FATHER_PATH = new File("src\\com\\xct\\servlet\\");
    private TreeNode rootPath;

    public PathTree() {
        this.rootPath = new TreeNode();
        creatTree(this.rootPath,FATHER_PATH);
    }

    private void creatTree(TreeNode treeNode,File fatherPath){
        HashMap<String,String> subFile= treeNode.subFile;
        HashMap<String, TreeNode> subdirectory = treeNode.subdirectory;
        //处理文件
        File[] files = fatherPath.listFiles();
        if (files != null && files.length > 0) {
            for (File file : files) {
                String className = getClassName(file.getPath());
                try {
                    subFile.put(getWebServletValue(className), className);
                } catch (ClassNotFoundException e) {
                    Loger.exception(e);
                }
            }
        }
        //处理目录
        File[] directory = fatherPath.listFiles(File::isDirectory);
        if (directory != null && directory.length > 0) {
            for (File dir : directory) {
                subdirectory.put(dir.getName(), new TreeNode());
                creatTree(subdirectory.get(dir.getName()), dir);
            }
        }
    }

    private String getClassName(String classPath){
        String path=classPath.replace('\\','.');
        path=path.substring(path.indexOf(".")+1,path.lastIndexOf("."));
        return path;
    }

    private String getWebServletValue(String className) throws ClassNotFoundException {
        Class<?extends MyServlet> servlet= (Class<? extends MyServlet>) Class.forName(className);
        WebServlet path = servlet.getAnnotation(WebServlet.class);
        return path.value();
    }

    public String search(String[] path){
        String result="";
        TreeNode p=rootPath;
        for (int i = 0; i < path.length && null!=p; i++) {
            if (i == path.length-1){
                result = p.subFile.get(path[i]);
                break;
            }
            p=p.subdirectory.get(path[i]);
        }
        if (result==null){
            result = "";
        }
        if ("".equals(result)){
            Loger.log("404 客户端输入网址错误");
        }
        return result;
    }
}
class TreeNode{
    public TreeNode() {
        subdirectory = new HashMap<>();
        subFile = new HashMap<>();
    }

    HashMap<String,TreeNode> subdirectory;
    HashMap<String,String> subFile;
}