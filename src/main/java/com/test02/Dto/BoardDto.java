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

    // 스마트에디터 파일 업로드
    private MultipartFile filedata;
    private String callback;
    private String callback_func;

    // Pagination
    private int startIndex;
    private int cntPerPage; //getPageSize
    private int curPage;


}
