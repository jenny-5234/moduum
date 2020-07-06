package com.test02.Controller;


import com.test02.Dto.BoardDto;
import com.test02.Dto.Pagination;
import com.test02.Service.BoardServiceImpl;
import lombok.SneakyThrows;
//import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
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
                            Model model) throws Exception {

        // 전체 게시글 개수
        int listCnt = boardService.getBoardListCnt(boardDto);

        Pagination pagination = new Pagination(listCnt, curPage);

//        System.out.println(pagination);
//        System.out.println(pagination.getStartIndex());

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

        MultipartFile mfile = boardDto.getFile();

        String realPath = servletContext.getRealPath("/");
        System.out.println("------------------" + realPath);

        if (!mfile.isEmpty()) {

            String uploadPath = "src/main/webapp/image/uploadFile";

            System.out.println(uploadPath);

            String origName = mfile.getOriginalFilename();
            String saveName = System.currentTimeMillis() + origName;

            boardDto.setB_FileName(saveName);
            boardDto.setB_FilePath("/image/uploadFile");

            File file = new File(realPath + "/image/uploadFile" + File.separator + saveName);
            System.out.println(file.getPath());

            mfile.transferTo(file);
        }

        boardService.insert(boardDto);

        return "redirect:/board/boardlist";
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

}
