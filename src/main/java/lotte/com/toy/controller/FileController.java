package lotte.com.toy.controller;

import lotte.com.toy.dto.FileDto;
import lotte.com.toy.service.FileService;
import lotte.com.toy.util.FileUtil;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FileController {
    Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    FileService fileService;

    /**
     * 파일 리스트 조회
     * @param model
     * @return
     */
    @GetMapping("/file.do")
    public String fileDetail(Model model) {
        logger.info("FileController");
        System.out.println("FileController");

        List<FileDto> fileList = fileService.getFileList();

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("file_where_use", "1");
        map.put("file_use_id", 1);

        List<FileDto> fileListByFileWhereUse = fileService.getFileListByFileWhereUse(map);

        for (FileDto dto : fileListByFileWhereUse) {
            System.out.println(dto.getFile_name());
        }
        model.addAttribute("fileList", fileList);
        model.addAttribute("fileListByFileWhereUse", fileListByFileWhereUse);

        return "filedetail";
    }


    /**
     * 파일 업로드
     * @param fileDto
     * @param fileload
     * @param req
     * @return
     */
    @ResponseBody
    @PostMapping("/fileupload.do")
    public String fileInsert(FileDto fileDto, @RequestParam("fileload") MultipartFile fileload, HttpServletRequest req) {
        logger.info("FileController fileInsert()");

        String filename = fileload.getOriginalFilename();
        fileDto.setFile_original_name(filename);

        String fupload = req.getServletContext().getRealPath("/upload");

        // 파일명 변경
        String newfilename = FileUtil.getNewFileName(fileDto.getFile_original_name());
        fileDto.setFile_name(newfilename);

        // 설정 필요
        fileDto.setFile_use_id(Integer.parseInt(req.getParameter("file_where_use")));
        fileDto.setFile_where_use(req.getParameter("file_use_id").charAt(0));

        File file = new File(fupload + "/" + newfilename);

        String msg = "삽입 실패";

        try {

            // 실제로 업로드
            FileUtils.writeByteArrayToFile(file, fileload.getBytes());

            // DB에 저장
            int c = fileService.insertFile(fileDto);

            if (c>0) {
                System.out.println("삽입 성공");
                System.out.println(file.getName());
                msg = "삽입 성공";
            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        return "filedetail";
    }
}
