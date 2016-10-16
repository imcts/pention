package com.model;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class File_All {

	@Resource
	DataBean databean;

	public List commaDelete(String filename) {

		ArrayList list = new ArrayList();

		String[] arr = filename.split(",");

		for (int i = 0; i < arr.length; i++) {
			list.add(arr[i]);
		}

		return list;
	}

	public String commaPlus(String[] arr) {
		String res = "";

		if (arr != null) {
			for (int i = 0; i < arr.length; i++) {
				res += arr[i] + ",";
			}
		}
		return res;
	}

	public void freeboardInput(List<MultipartFile> fileList, String path) {

		String res = "";
		String p = "";
		int cnt = 0;

		for (int i = 0; i < fileList.size(); i++) {
			if (!fileList.get(i).getOriginalFilename().equals("")) {// 넘어온 파일의
																	// 값이 있을때만
																	// 진입한다.
				MultipartFile file = fileList.get(i);
				String fileName = fileList.get(i).getOriginalFilename();

				File f = new File(path + fileName);

				int no = 0;

				p = fileName;

				while (f.exists()) {
					no++;
					p = no + fileName;
					f = new File(path + p);
				}

				res += p + ",";

				p = "";

				cnt++;

				try {
					byte[] arr = file.getBytes();
					FileOutputStream fos = new FileOutputStream(f);
					fos.write(arr);
					fos.close();

				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}

		System.out.println(cnt + " : cnt의값");

		if (cnt == 0) {
			this.databean.setFupfile("0,");
		} else {
			this.databean.setFupfile(res);
		}
	}

	public void deleteFile(String mainPhoto, Object areaPhoto, String path) {

		File file = new File(path + mainPhoto);
		file.delete();

		if (areaPhoto != null) {
			for (int i = 0; i < ((List) areaPhoto).size(); i++) {
				file = new File(path + ((List) areaPhoto).get(i));
				file.delete();
			}
		}
	}

	public void roomDeleteFile(Object areaPhoto, String path) {
		System.out.println(areaPhoto + "에어리어 포토");
		if (areaPhoto != null) {
			for (int i = 0; i < ((List) areaPhoto).size(); i++) {
				File file = new File(path + ((List) areaPhoto).get(i));
				file.delete();
			}
		}
	}

	public void pentionRoomPhotoInput(List<MultipartFile> fileList, String path) {
		// System.out.println(fileList+"펜션룸 파일명들.");
		String res = "";
		String p = "";
		int cnt = 0;

		for (int i = 0; i < fileList.size(); i++) {
			if (!fileList.get(i).getOriginalFilename().equals("")) {// 넘어온 파일의
																	// 값이 있을때만
																	// 진입한다.
				MultipartFile file = fileList.get(i);
				String fileName = fileList.get(i).getOriginalFilename();

				File f = new File(path + fileName);

				int no = 0;

				p = fileName;

				while (f.exists()) {
					no++;
					p = no + fileName;
					f = new File(path + p);
				}

				res += p + ",";

				p = "";

				cnt++;

				try {
					byte[] arr = file.getBytes();
					FileOutputStream fos = new FileOutputStream(f);
					fos.write(arr);
					fos.close();

				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}

		// System.out.println(cnt+" : cnt의값");
		// System.out.println(res+" : res의값");
		if (cnt == 0) {
			this.databean.setAreaPhotoGet("0,");
		} else {
			this.databean.setAreaPhotoGet(res);
		}
	}

	public void PentionfileInput(List<MultipartFile> fileList, String path) {

		String res = "";
		String p = "";
		// System.out.println("펜션의 방이름 진입.");
		int cnt = 0;
		for (int i = 0; i < fileList.size(); i++) {
			if (!fileList.get(i).getOriginalFilename().equals("")) {// 넘어온 파일의
																	// 값이 있을때만
																	// 진입한다.
				MultipartFile file = fileList.get(i);
				String fileName = fileList.get(i).getOriginalFilename();

				File f = new File(path + fileName);

				int no = 0;

				p = fileName;

				while (f.exists()) {
					no++;
					p = no + fileName;
					f = new File(path + p);
				}

				if (i == 0) {
					this.databean.setMainphoto(p);
				} else {
					res += p + ",";
				}

				// System.out.println(p+"방등록에서의 파일의 이름.");
				p = "";
				try {
					byte[] arr = file.getBytes();
					FileOutputStream fos = new FileOutputStream(f);
					fos.write(arr);
					fos.close();

				} catch (Exception e) {
					e.printStackTrace();
				}
				cnt++;
			}
		}

		if (cnt == 0) {
			this.databean.setMainphoto("0,");
			this.databean.setAreaPhotoGet("0,");
		} else {
			this.databean.setAreaPhotoGet(res);
		}
		// System.out.println();
		// System.out.println(this.databean.getAreaPhotoGet()+"방등록시 파일의 마지막이름.");
	}

}
