package com.test02.Dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;

@Data
public class NoticeDto {
    private int NoticeId;
    private String N_Writer;
    private String N_Password;
    private String N_Title;
    private String N_Context;
    private Date N_Date;
    private int N_Count;

    // 스마트에디터 파일 업로드
    private MultipartFile filedata;
    private String callback;
    private String callback_func;

    // Pagination
    private int startIndex;
    private int cntPerPage; //getPageSize
    private int curPage;

}
