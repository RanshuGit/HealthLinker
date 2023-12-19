/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;


import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.util.Scanner;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.swing.JOptionPane;
import sun.misc.BASE64Encoder;



public class encryption 
{
//public static void main(String args[])
//{
//     Scanner s=new Scanner(System.in);
//            System.out.println("Enter text for encrypt");
//            String t=s.next();
//	new encryption().encrypt(t);
//}
public String encrypt(String text,SecretKey secretkey)
{
    String plainData=null,cipherText=null;
	try
	{
    	 plainData=text;
         
        //secretkey generating
//	KeyGenerator keyGen = KeyGenerator.getInstance("AES");
//	keyGen.init(128);
//	SecretKey secretKey = keyGen.generateKey();
//        System.out.println("secret key:"+secretKey);
//
//        //converting secretkey to String
//            byte[] b=secretKey.getEncoded();//encoding secretkey
//            String skey=Base64.encode(b);
//            System.out.println("converted secretkey to string:"+skey);
            
//            //converting string to secretkey
//            byte[] bs=Base64.decode(skey);
//            SecretKey sec=new SecretKeySpec(bs, "AES");
//            System.out.println("converted string to seretkey:"+sec);
         
            
        Cipher aesCipher = Cipher.getInstance("AES");//getting AES instance
	aesCipher.init(Cipher.ENCRYPT_MODE,secretkey);//initiating ciper encryption using secretkey
                     
        byte[] byteDataToEncrypt = plainData.getBytes();
	byte[] byteCipherText = aesCipher.doFinal(byteDataToEncrypt);//encrypting data 
	
          //  System.out.println("ciper text:"+byteCipherText);
        
        cipherText = new BASE64Encoder().encode(byteCipherText);//converting encrypted data to string 
    
        System.out.println("\n Given text : "+plainData+" \n Cipher Data : "+cipherText);
	       
        }
	catch(Exception e)
	{
	           System.out.println(e);	
	}
    return cipherText;
}

}



