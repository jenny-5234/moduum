package com.test02.Dto;

import lombok.Data;

@Data
public class NewsDto {
    private int newsId;
    private String title;
    private String description;
    private String originallink;
    private String date;

    private int startIndex;
    private int cntPerPage;
    private int curPage;
}
