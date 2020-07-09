package com.test02.Dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;

@Data
public class BoardDto {
    private int BoardId;
    private String B_Writer;
    private String B_Password;
    private String B_Title;
    private String B_Context;
    private Date B_Date;
    private int B_Count;

    private MultipartFile file;
    private String callback;
    private String callback_func;

    private String B_FileName;
    private String B_FilePath;

    private int startIndex;
    private int cntPerPage; //getPageSize
    private int curPage;


}
