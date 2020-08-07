package com.test02.Controller;

import com.test02.Dto.BoardDto;
import com.test02.Dto.Pagination;

//import com.test02.Dto.Search;
import com.test02.Service.BoardServiceImpl;
import lombok.SneakyThrows;
//import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

@RequestMapping("/board")
@Controller
//@Slf4j
public class BoardController {

    @Autowired
    ServletContext servletContext;

    @Autowired
    BoardServiceImpl boardService;

    // 1. 게시글 목록
    @GetMapping("/boardlist")
    public String boardList(@ModelAttribute("boardDto") BoardDto boardDto,
                            @RequestParam(required = false, defaultValue = "1") int curPage,
                            @RequestParam(required = false, defaultValue = "title") String searchType,
                            @RequestParam(defaultValue =" ") String keyword,
                            Model model) throws Exception {

//        Search search = new Search();
//        search.setSearchType(searchType);
//        search.setKeyword(keyword);

        // 전체 게시글 개수
        int listCnt = boardService.getBoardListCnt(boardDto);

        Pagination pagination = new Pagination(listCnt, curPage);

        boardDto.setStartIndex(pagination.getStartIndex());
        boardDto.setCntPerPage(pagination.getPageSize());
        boardDto.setCurPage(pagination.getCurPage());

        List<BoardDto> board = boardService.getBoardList(boardDto);

        model.addAttribute("board", board);
        model.addAttribute("pagination", pagination);

        return "/board/boardlist";
    }

    // 2. 게시글 작성
    @RequestMapping("/write")
    public String writeBoard() {
        return "/board/write";
    }

    @PostMapping(value = "insert.do")
    public String insert(BoardDto boardDto) throws Exception {

        boardService.insert(boardDto);

        return "redirect:/board/boardlist";
    }

    //스마트 에디터 이미지 파일 업로드 기능
    @SneakyThrows
    @PostMapping(value = "/fileupload.do")
    public String simpleImageUploader(HttpServletRequest request, BoardDto boardDto) {
        System.out.println("FileUploadController");
        String return1 = request.getParameter("callback");
        String return2 = "?callback_func=" + request.getParameter("callback_func");
        System.out.println(return1);
        System.out.println(return2);
        String return3 = "";
        String name = "";

        try {
            if (boardDto.getFiledata() != null && boardDto.getFiledata().getOriginalFilename() != null && !boardDto.getFiledata().getOriginalFilename().equals("")) {
                name = boardDto.getFiledata().getOriginalFilename().substring(boardDto.getFiledata().getOriginalFilename().lastIndexOf(File.separator) + 1);
                System.out.println(name);
                String file_ext = name.substring(name.lastIndexOf(".") + 1);
                System.out.println(file_ext);
                String[] allow_file = {"jpg", "png", "bmp", "gif"};
                int cnt = 0;
                for (int i = 0; i < allow_file.length; i++) {
                    if (file_ext.equals(allow_file[i])) {
                        cnt++;
                    }
                }
                if (cnt == 0) {
                    return3 = "&errstr=" + name;
                } else {
                    // 기본 파일경로
                    String dfFilePath = request.getSession().getServletContext().getRealPath("/");
                    System.out.println(dfFilePath);
                    // 파일 상세경로
                    String filePath = dfFilePath + "image/uploadFile" + File.separator;
                    System.out.println(filePath);
                    File file = new File(filePath);
                    if (!file.exists()) {
                        file.mkdirs();
                    }
                    String realFilename = "";
                    realFilename = UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
                    System.out.println(realFilename);
                    String servFilename = filePath + realFilename;
                    // 서버에 파일쓰기
                    System.out.println(servFilename);
                    boardDto.getFiledata().transferTo(new File(servFilename));

                    return3 += "&bNewLine=true";
                    return3 += "&sFileName=" + name;
                    return3 += "&sFileURL=/image/uploadFile/" + realFilename;
                }
            } else {
                return3 += "&errstr=error";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + return1 + return2 + return3;
    }


    // 3. 게시글 상세보기
    @GetMapping(value = "/pageview")
    public String pageDetail(@RequestParam int BoardId, Model model) {
        BoardDto boardDto = boardService.pageDetail(BoardId);
        model.addAttribute("boardDto", boardDto);
        return "board/pageview";
    }

    // 4. 게시글 수정
    @GetMapping(value = "/modify")
    public String update(@RequestParam(value = "boardId") int boardId, Model model) throws Exception {
        BoardDto boardDto = boardService.pageModifyDetail(boardId);
        model.addAttribute("boardDto", boardDto);
        return "/board/modify";
    }

    @PostMapping(value = "update.do")
    public String updateDo(BoardDto boardDto, Model model,
                           @RequestParam(value = "BoardId") int boardId,
                           @RequestParam(defaultValue = "1") int curPage) throws Exception {

        int listCnt = boardService.getBoardListCnt(boardDto);

        Pagination pagination = new Pagination(listCnt, curPage);

        boardDto.setStartIndex(pagination.getStartIndex());
        boardDto.setCntPerPage(pagination.getPageSize());
        boardDto.setCurPage(pagination.getCurPage());

        boardService.update(boardDto);

        model.addAttribute("board", boardService.getBoardList(boardDto));
        model.addAttribute("pagination", pagination);

        System.out.println(boardService.pageModifyDetail(boardId));
        return "redirect:/board/boardlist";
    }

    // 5. 게시글 삭제
    @SneakyThrows
    @GetMapping(value = "delete.do")
    public String delete(@RequestParam(value = "boardId", required = false) int boardId) {
        boardService.delete(boardId);

        return "redirect:/board/boardlist";
    }

    // 6. 게시글 검색
    @PostMapping(value = "search.do")
    public String searchList(@ModelAttribute("boardDto") BoardDto boardDto,
                            @RequestParam(required = false, defaultValue = "1") int curPage,
                            Model model,HttpServletRequest request) throws Exception {

        String searchType = request.getParameter("searchType");
        String keyWord = request.getParameter("keyWord");

        List<BoardDto> searchList;


        if(searchType == null){
            searchList = boardService.getBoardList(boardDto);
        }else if(searchType.equals("title")) {
            searchList = boardService.getSearchList_Title(boardDto,keyWord);
        }else if(searchType.equals("writer")){
            searchList = boardService.getSearchList_Writer(boardDto,keyWord);
        }else {
            searchList = boardService.getBoardList(boardDto);
        }

        Pagination pagination = new Pagination(searchList.size(), curPage);

        boardDto.setStartIndex(pagination.getStartIndex());
        boardDto.setCntPerPage(pagination.getPageSize());
        boardDto.setCurPage(pagination.getCurPage());

        model.addAttribute("board", searchList);
        model.addAttribute("pagination", pagination);

        return "/board/boardlist";
    }

}
