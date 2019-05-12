package com.shop.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
/**
 * 更改上传文件的文件名
 * @author xiaohai
 *
 */
public class UploadUtils {
	/**
	 * 更改文件名
	 * @param fileName 旧文件名
	 * @return 新文件名
	 */
	public static String getFileName(String fileName) {
		int indx = fileName.lastIndexOf(".");
		String end = fileName.substring(indx);
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmsss");
		String dateString = formatter.format(currentTime);
		String uuid = UUID.randomUUID().toString().replace("-", "").substring(0,5);
		fileName = dateString+uuid+end;
		return fileName;
	}
	/*
	 * public static void main(String[] args) {
	 * System.out.println(getFileName("1546546.txt")); }
	 */
}
