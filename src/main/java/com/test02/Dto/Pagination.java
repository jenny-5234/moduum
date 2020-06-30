package com.test02.Dto;

import lombok.Data;

@Data
public class Pagination {
    private int pageSize = 10;       // 한 페이지당 게시글 수
    private int rangeSize = 10;      // 한 블럭당 페이지 수
    private int curPage = 1;         //page
    private int curRange = 1;        //range

    // 총 게시글 수, 페이지 수, 블럭수
    private int listCnt, pageCnt, rangeCnt ;

    private int startPage = 1;
    private int endPage = 1;

    private int startIndex = 0;

    private int prevPage, nextPage;

    public Pagination(int listCnt, int curPage) {
        // 현재 페이지
        setCurPage(curPage);
        // 총 게시물 수
        setListCnt(listCnt);

        // 1. 총 페이지 수
        setPageCnt(listCnt);
        // 2. 총 블럭 수
        setRangeCnt(pageCnt);
        // 3. 블럭
        rangeSetting(curPage);

        setStartIndex(curPage);
    }

    public void setPageCnt(int listCnt) {
        this.pageCnt = (int) Math.ceil(listCnt * 1.0 / pageSize);
    }

    public void setRangeCnt(int pageCnt) {
        this.rangeCnt = (int) Math.ceil(pageCnt * 1.0 / rangeSize);
    }

    public void rangeSetting(int curPage) {

        setCurRange(curPage);

        this.startPage = (curRange - 1) * rangeSize + 1;
        this.endPage = startPage + rangeSize - 1;

        if (endPage > pageCnt) {
            this.endPage = pageCnt;
        }

        this.prevPage = curPage - 1;
        this.nextPage = curPage + 1;
    }

    public void setCurRange(int curPage) {
        this.curRange = (int) ((curPage - 1) / rangeSize) + 1;
    }

    public void setStartIndex(int curPage) {
        this.startIndex = (curPage - 1) * pageSize;
    }


//    protected Arraylist<BoardDto> getAllBoardDtos(){
//        return new ArrayList<BoardDto>() = 쿼리날려서 가져오는거
//    }
//
//    protected HashMap<Integer, ArrayList<BoardDto>> makeHashMap( ArrayList<BoardDto> boardDtos){
//        HashMap<Integer, ArrayList<BoardDto>> DDa = new HashMap<>();
//        ArrayList<BoardDto>
//        for (int i = 0; i < ; i++) {
//
//        }
//    }

}

