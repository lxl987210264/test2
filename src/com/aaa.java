package com;

import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.net.MalformedURLException;  
import java.net.URL;  
import java.net.URLConnection;  
  
public class aaa {  
      
    public static void DownloadFile(URL theURL, String filePath) throws IOException {  
        URLConnection con = theURL.openConnection();  
        String urlPath = con.getURL().getFile();  
        String fileFullName = urlPath.substring(urlPath.lastIndexOf("/") + 1);  
        if (fileFullName != null) {  
            byte[] buffer = new byte[4 * 1024] ;  
            int read;  
            String path = filePath + "/" + fileFullName;  
            File fileFolder = new File(filePath);  
            if(!fileFolder.exists()){  
                fileFolder.mkdir();  
            }  
            InputStream in = con.getInputStream();  
            FileOutputStream os = new FileOutputStream(path);  
            while ((read = in.read(buffer)) > 0) {  
                os.write(buffer, 0, read);  
            }  
            os.close();  
            in.close();  
            long end = System.currentTimeMillis();  
        } else {  
        }  
    }  
      
    public static void main(String[] args) {  
        String urlS = "http://192.168.100.11:8080/uzou_yunwei/images/1.jpg????-----1111";  
        String filePathString = "d:/ÖÐÎÄ";  
        URL url;  
        try {  
            url = new URL(urlS);  
            try {  
                DownloadFile(url,filePathString);  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        } catch (MalformedURLException e) {  
            e.printStackTrace();  
        }  
          
    }  
 
}  