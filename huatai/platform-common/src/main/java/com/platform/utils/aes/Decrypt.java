package com.platform.utils.aes;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.net.URLDecoder;
import java.security.SecureRandom;
import java.util.zip.ZipInputStream;

public class Decrypt {
    private static Log logger = LogFactory.getLog(Decrypt.class);

    private static byte[] unZip(byte[] bContent) {
        byte[] b = (byte[]) null;
        try {
            ByteArrayInputStream bis = new ByteArrayInputStream(bContent);
            ZipInputStream zip = new ZipInputStream(bis);
            while (zip.getNextEntry() != null) {
                byte[] buf = new byte[1024];
                int num = -1;
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                while ((num = zip.read(buf, 0, buf.length)) != -1) {
                    baos.write(buf, 0, num);
                }
                b = baos.toByteArray();
                baos.flush();
                baos.close();
            }
            zip.close();
            bis.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return b;
    }

    private static byte[] decodeBase64(String source) {
        return org.apache.commons.codec.binary.Base64.decodeBase64(source);
    }

    /**
     * 方法描述：AES解密，含解压缩
     * 创建日期：2016年8月29日
     * 作者：陈德兵
     *
     * @param param 解密内容
     * @param key   秘钥
     * @return 解密结果
     */
    public static String decrypt(String param, String key) {
        try {
            return decode(toDecrypt(new String(unZip(decodeBase64(param))), key));
        } catch (Exception e) {
            return null;
        }
    }

    private static String decode(String str) {
        String str2 = "";
        try {
            str2 = URLDecoder.decode(str, "UTF-8");
        } catch (Exception e) {
            logger.error(ExceptionUtils.getStackTrace(e));
        }
        return str2;
    }

    private static String toDecrypt(String content, String password) {
        try {
            KeyGenerator kgen = KeyGenerator.getInstance("AES");
            SecureRandom srandom = SecureRandom.getInstance("SHA1PRNG");
            srandom.setSeed(password.getBytes());
            kgen.init(128, srandom);
            SecretKey secretKey = kgen.generateKey();
            byte[] enCodeFormat = secretKey.getEncoded();
            SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");
            Cipher cipher = Cipher.getInstance("AES");// 创建密码器
            cipher.init(Cipher.DECRYPT_MODE, key);// 初始化
            byte[] result = cipher.doFinal(Base64.decode(content));
            return new String(result); // 加密
        } catch (Exception e) {
            logger.error(ExceptionUtils.getStackTrace(e));
        }
        return null;
    }

    public static void main(String[] args) {
        String aa = decrypt("UEsDBBQACAgIALRwMEkAAAAAAAAAAAAAAAADAAAAemlwBcFHgoIwAADAB3EAAoR42MMi0qSphHajNxNWJCC+fmc4JIPY3OGWYFgUQzFuERFVqgvPkBv8/d4gXWEQvjm01JGVR/eHd5I+4e1JgvACblfCH9q71WSpsw2zDfw9xcP0xNZTFzSL5xl69cxkKTndNOlRe+4y2N/4nOyM0a9DeL1ZBEWis4yzqH0UlV5KmSOUf7rjMRl6xF3IMl+Q+r5rnzXQ1XVcaBPP2ttuOvMMpjjavpu7U+Df1AT0FCm0z0e8Gqfo1FNMoDJazpR8RG5fq4Zn9R7GbntMRr4vDwQL0Z9KrkN5Si9NbcK4HnOQpFzvLiHHuivf0eMieg4h/aJkIce/z0DAqqBogye+kqb83LzZ75rdbr73kyytX8DG1BgCpzBfAvVMxu3JABEbJ1TFJK9nP95mw2mvlxjpDu22oeoS2yj+aGX2ZaBTPsMi9n/VrG5pTu7d2o7JEVhhZmMf99aURuKcyEOzXYtH5lQFLEFwllfjaOEGxI1XUheIvz8//1BLBwjiIcoygQEAANgBAABQSwECFAAUAAgICAC0cDBJ4iHKMoEBAADYAQAAAwAAAAAAAAAAAAAAAAAAAAAAemlwUEsFBgAAAAABAAEAMQAAALIBAAAAAA==", "!@sHgfPt5#&dfKH9");
        System.out.println(aa);
    }
}