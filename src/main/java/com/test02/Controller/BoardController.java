package com.test02.Controller;


import com.test02.Dto.BoardDto;
import com.test02.Service.BoardServiceImpl;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/board")
@Controller
public class BoardController {

    @Autowired
    BoardServiceImpl boardService;

    // 1. 게시글 목록
    @GetMapping("/boardlist")
    public String list(Model model) {
        List<BoardDto> board = boardService.getBoardList();

        model.addAttribute("board", board);

        return "/board/boardlist";
    }

    // 2. 게시글 작성
    @RequestMapping("/write")
    public String writeBoard() {
        return "/board/write";
    }

    @PostMapping(value = "insert.do")
    public String insert(BoardDto boardDto) throws Exception {
        System.out.println(boardDto);
        boardService.insert(boardDto);
        return "redirect:/board/boardlist";
    }

    // 3. 게시글 상세보기
    @GetMapping(value = "/pageview")
    public String pageDetail(@RequestParam int BoardId, Model model ) {
        BoardDto boardDto = boardService.pageDetail(BoardId);
        model.addAttribute("boardDto", boardDto);
        return "board/pageview";
    }

    // 4. 게시글 수정
    @GetMapping(value = "/modify")
    public String update(@RequestParam(value = "boardId") int boardId, Model model) throws Exception {
        BoardDto boardDto = boardService.pageDetail(boardId);
        model.addAttribute("boardDto", boardDto);
        return "/board/modify";
    }

    @PostMapping(value = "update.do")
    public String updateDo(BoardDto boardDto, Model model, @RequestParam(value = "BoardId") int boardId) throws Exception {
        boardService.update(boardDto);
        model.addAttribute("board", boardService.getBoardList());
        System.out.println(boardService.pageDetail(boardId));
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
