/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 文件分类Entity
 * @author spark
 * @version 2017-12-12
 */
public class ArchiveFile extends DataEntity<ArchiveFile> {
	
	private static final long serialVersionUID = 1L;
	private String fileName;		// file_name
	private String fileCode;		// file_code
	
	public ArchiveFile() {
		super();
	}

	public ArchiveFile(String id){
		super(id);
	}

	@Length(min=0, max=50, message="file_name长度必须介于 0 和 50 之间")
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	@Length(min=0, max=12, message="file_code长度必须介于 0 和 12 之间")
	public String getFileCode() {
		return fileCode;
	}

	public void setFileCode(String fileCode) {
		this.fileCode = fileCode;
	}
	
}