package com.platform.utils.aes;

import org.apache.commons.codec.binary.StringUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.io.ByteArrayOutputStream;
import java.security.SecureRandom;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class Encrypt {
	private static Log logger = LogFactory.getLog(Encrypt.class);
	/**
	 * 方法描述：AES加密
	 * 创建日期：2016年8月29日
	 * 作者：陈德兵
	 * @param param 加密内容
	 * @param key 秘钥
	 * @return 加密结果
	 */
	public static String encrypt(String param,String key){
		try {
			return new String(encodeBase64(zip(StringUtils.getBytesUtf8(toEncrypt(encode(param), key)))));
		} catch (Exception e) {
			return null;
		}
	}
	
	private static String encode(String str){//java.net.URLEncoder.encode
		String str2="";
		try {
			str2 = java.net.URLEncoder.encode(str,"UTF-8");
		} catch (Exception e) {
			logger.error(ExceptionUtils.getStackTrace(e));
		}
		return str2;
	}

	private static byte[] zip(byte[] bContent) {

		byte[] b = null;
		try {
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			ZipOutputStream zip = new ZipOutputStream(bos);
			ZipEntry entry = new ZipEntry("zip");
			entry.setSize(bContent.length);
			zip.putNextEntry(entry);
			zip.write(bContent);
			zip.closeEntry();
			zip.close();
			b = bos.toByteArray();
			bos.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return b;
	}

	private static byte[] encodeBase64(byte[] source) {
		return org.apache.commons.codec.binary.Base64.encodeBase64(source);
	}
	
	private static String toEncrypt(String content, String password) {
		try {
			KeyGenerator kgen = KeyGenerator.getInstance("AES");
			SecureRandom srandom=SecureRandom.getInstance("SHA1PRNG");
			srandom.setSeed(password.getBytes());
			kgen.init(128, srandom);
			SecretKey secretKey = kgen.generateKey();
			byte[] enCodeFormat = secretKey.getEncoded();
			SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");
			Cipher cipher = Cipher.getInstance("AES");// 创建密码器
			byte[] byteContent = content.getBytes("utf-8");
			cipher.init(Cipher.ENCRYPT_MODE, key);// 初始化
			byte[] result = cipher.doFinal(byteContent);
			return Base64.encode(result);//Base64.encodeBase64String(result); // 加密
		} catch (Exception e) {
			logger.error(ExceptionUtils.getStackTrace(e));
		}
		return null;
	}
	
}
