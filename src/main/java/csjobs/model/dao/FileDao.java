package csjobs.model.dao;

import csjobs.model.File;

public interface FileDao {

	public File saveFile(File file);

	public File getFile(Long cv);


}
