package lotte.com.toy.dao;

import lotte.com.toy.dto.FileDto;

import java.util.List;
import java.util.Map;

public interface FileDao {
    List<FileDto> getFileList();

    List<FileDto> getFileListByFileWhereUse(Map<String, Object> whereUseId);

    int insertFile(FileDto fileDto);

    int deleteFileByFileUseId(Map<Character, Integer> whereUseId);
}
