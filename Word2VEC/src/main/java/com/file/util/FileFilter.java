package com.file.util;

import java.io.File;
import java.io.FilenameFilter;

public class FileFilter implements FilenameFilter {
	
	private String extendName;
	public FileFilter(String fileType) {
		extendName = "." + fileType;
	}
	@Override
	public boolean accept(File dir, String name) {
		return name.endsWith(extendName);
	}

}
