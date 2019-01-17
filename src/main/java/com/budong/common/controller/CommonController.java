package com.budong.common.controller;

import java.io.*;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.budong.common.common.CommandMap;
import com.budong.common.service.CommonService;

@Controller
public class CommonController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "commonService")
	private CommonService commonService;

	@RequestMapping(value = "/common/downloadFile.do")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response) throws Exception {
		Map<String, Object> map = commonService.selectFileInfo(commandMap.getMap());
		String storedFileName = (String) map.get("STORED_FILE_NAME");
		String originalFileName = (String) map.get("ORIGINAL_FILE_NAME");

		byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\dev\\file\\" + storedFileName));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);

		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

	@RequestMapping(value = "/common/viewImageFile.do")
	public void viewImageFile(CommandMap commandMap, HttpServletResponse response) throws Exception {

		// 불러와야할 이미지에 대한 식별값을 파라미터로 받아옴.
		Map<String, Object> map = commonService.selectFileInfo(commandMap.getMap());
		String storedFileName = (String) map.get("STORED_FILE_NAME");
		// String originalFileName = (String)map.get("ORIGINAL_FILE_NAME";);

		if (storedFileName.indexOf(".jpg") > -1 || storedFileName.indexOf(".png") > -1
				|| storedFileName.indexOf(".bmp") > -1) {

			String pathString = "C:\\dev\\file";
			log.debug("File.separator=" + File.separator);
			File file = new File((pathString + File.separator + storedFileName));
			FileInputStream fis = null;

			BufferedInputStream in = null;
			ByteArrayOutputStream bStream = null;

			try {
				fis = new FileInputStream(file);
				in = new BufferedInputStream(fis);
				bStream = new ByteArrayOutputStream();
				int imgByte;
				while ((imgByte = in.read()) != -1) {
					bStream.write(imgByte);
				}

				// response.setHeader("Content-Type", type);
				response.setContentLength(bStream.size());

				bStream.writeTo(response.getOutputStream());
				response.getOutputStream().flush();
				response.getOutputStream().close();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (bStream != null) {
					try {
						bStream.close();
					} catch (Exception est) {
						est.printStackTrace();
					}
				}
				if (in != null) {
					try {
						in.close();
					} catch (Exception ei) {
						ei.printStackTrace();
					}
				}

				if (fis != null) {
					try {
						fis.close();
					} catch (Exception efis) {
						efis.printStackTrace();
					}
				}
			}
		}
	}

}
