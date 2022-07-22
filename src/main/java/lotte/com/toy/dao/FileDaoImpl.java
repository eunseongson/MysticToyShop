package lotte.com.toy.dao;

import lotte.com.toy.dto.FileDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class FileDaoImpl implements FileDao {

    @Autowired
    SqlSession session;

    String nameSpace = "File.";


    /**
     * 파일리스트 전체 조회
     * @return
     */
    @Override
    public List<FileDto> getFileList() {
        return session.selectList(nameSpace+"getFileList");
    }

    /**
     * (file_where_use, file_use_id) 로 파일 리스트 조회
     * @param whereUseId
     * @return
     */
    @Override
    public List<FileDto> getFileListByFileWhereUse(Map<String, Object> whereUseId) {
        return session.selectList(nameSpace+"getFileListByFileUseId", whereUseId);
    }

    /**
     * 파일 업로드
     * @param fileDto
     * @return
     */
    @Override
    public int insertFile(FileDto fileDto) {
        return session.insert(nameSpace+"insertFile", fileDto);
    }

    /**
     * (file_where_use, file_use_id) 로 파일 삭제
     * @param whereUseId
     * @return
     */
    @Override
    public int deleteFileByFileUseId(Map<Character, Integer> whereUseId) {
        return session.delete(nameSpace+"deleteCartByCartId", whereUseId);
    }
}
