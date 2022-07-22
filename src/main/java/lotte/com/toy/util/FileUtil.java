package lotte.com.toy.util;

import java.util.Date;

public class FileUtil {
    public static String getNewFileName(String filename) {
        String newfilename = "";
        String fpost = "";

        if(filename.indexOf('.') >= 0) {		// abc.txt	확장자명이 있다
            fpost = filename.substring( filename.indexOf('.') );	// .txt

            newfilename = new Date().getTime() + fpost;		// 34324324.txt
        }else {
            newfilename = new Date().getTime() + ".back";
        }

        return newfilename;
    }
}
