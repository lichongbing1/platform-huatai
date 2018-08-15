package com.platform.utils.wechat;

import java.security.MessageDigest;

public class MD5 {
    private MD5() {
    }

    /*  * 生成 MD5
  *
          * @param data 待处理数据
  * @return MD5结果
  */
    public static String getMessageDigest(String data) {
        StringBuilder sb = new StringBuilder();
        try {
            java.security.MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] array = md.digest(data.getBytes("UTF-8"));

            for (byte item : array) {
                sb.append(Integer.toHexString((item & 0xFF) | 0x100).substring(1, 3));
            }
        } catch (Exception e) {
            return null;
        }
        return sb.toString().toUpperCase();
    }

//    public final static String getMessageDigest(byte[] buffer) {
//        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
//        try {
//            MessageDigest mdTemp = MessageDigest.getInstance("MD5");
//            mdTemp.update(buffer);
//            byte[] md = mdTemp.digest();
//            int j = md.length;
//            char str[] = new char[j * 2];
//            int k = 0;
//            for (int i = 0; i < j; i++) {
//                byte byte0 = md[i];
//                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
//                str[k++] = hexDigits[byte0 & 0xf];
//            }
//            return new String(str);
//        } catch (Exception e) {
//            return null;
//        }
//    }
}
