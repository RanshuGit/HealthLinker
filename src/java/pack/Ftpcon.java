package pack;

import java.io.File;
import java.io.FileInputStream;
import org.apache.commons.net.ftp.FTPClient;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author ibn
 */
public class Ftpcon {

    FTPClient client = new FTPClient();
    FileInputStream fis = null;
    boolean status;

    public boolean upload(File file) {
        try {
          //client.enterLocalPassiveMode();
            client.connect("ftp.adrive.com");
            client.login("ashwini.phoenixzone@gmail.com", "Ashwini123");
            client.enterLocalPassiveMode();
            //String filename = "/home/ibn/Desktop/report.txt";
            fis = new FileInputStream(file);
            status = client.storeFile("/D/" + file.getName(), fis);

            client.logout();
            fis.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        if (status) {
            System.out.println("success");
            return true;
        } else {
            System.out.println("failed");
            return false;

        }

    }
}
