package com.hsw.du.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		if(!model.containsKey("downloadFile")) { return; }
		
		File file = (File) model.get("downloadFile");
		if(file == null) { return; }
		
		String originFilename = String.valueOf(model.get("downloadFilename"));
		String filename = getFilename(request, originFilename);
		setResponse(response, filename, (int)file.length());
		
		try(
				OutputStream out = response.getOutputStream();
				FileInputStream fis = new FileInputStream(file);
		) {
			
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			// TODO: handle exception
			new RuntimeException(e.getMessage());
		}
	}
	
	private String getFilename(HttpServletRequest request, String originFilename) throws UnsupportedEncodingException {
		// TODO Auto-generated method stub
		String filename = null;
		String userAgent = request.getHeader("User-Agent");
		
		if(userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1) {
			filename = URLEncoder.encode(originFilename, "utf-8")
					.replaceAll("\\+", "%20");
		} else if(userAgent.indexOf("Chrome") > -1) {
			StringBuffer sb = new StringBuffer();
			for(char c : originFilename.toCharArray()) {
				if(c > '~') {
					sb.append(URLEncoder.encode(String.valueOf(c), "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			filename = sb.toString();
		} else {
			filename = new String(originFilename.getBytes("utf-8"));
		}
		
		return filename;
	}

	private void setResponse(HttpServletResponse response, String filename, int length) {
		// TODO Auto-generated method stub
		response.setContentType(getContentType());
		response.setContentLength(length);
		response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\";", filename));
		response.setHeader("Content-Transfer-Encoding", "binary");
	}
	
}
