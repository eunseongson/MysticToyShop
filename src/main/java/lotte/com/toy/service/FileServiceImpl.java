package lotte.com.toy.service;

import lotte.com.toy.dao.FileDao;
import lotte.com.toy.dto.FileDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class FileServiceImpl implements FileService{

    @Autowired
    FileDao fileDao ;

    /**
     * 파일리스트 전체 조회
     * @return
     */
    @Override
    public List<FileDto> getFileList() {
        return fileDao.getFileList();
    }

    /**
     * (file_where_use, file_use_id) 로 파일 리스트 조회
     * @param whereUseId
     * @return
     */
    @Override
    public List<FileDto> getFileListByFileWhereUse(Map<String, Object> whereUseId) {
        return fileDao.getFileListByFileWhereUse(whereUseId);
    }

    /**
     * 파일 업로드
     * @param fileDto
     * @return
     */
    @Override
    public int insertFile(FileDto fileDto) {
        return fileDao.insertFile(fileDto);
    }

    /**
     * (file_where_use, file_use_id) 로 파일 삭제
     * @param whereUseId
     * @return
     */
    @Override
    public int deleteFileByFileUseId(Map<Character, Integer> whereUseId) {
        return fileDao.deleteFileByFileUseId(whereUseId);
    }
}
