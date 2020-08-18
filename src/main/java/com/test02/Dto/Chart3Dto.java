package com.test02.Dto;

import lombok.Data;

@Data
public class Chart3Dto {
    private int Date;
    private String Sex;
    private String Category;
    private long Spend;


    public Chart3Dto() {}

    public Chart3Dto(int date, String sex, String category, long spend) {
        Date = date;
        Sex = sex;
        Category = category;
        Spend = spend;
    }
}
