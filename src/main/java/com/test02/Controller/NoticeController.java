package com.test02.Controller;

import com.test02.Dto.BoardDto;
import com.test02.Dto.NoticeDto;
import com.test02.Dto.Pagination;
import com.test02.Service.NoticeServiceImpl;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

@RequestMapping("/notice")
@Controller
public class NoticeController {

    @Autowired
    NoticeServiceImpl noticeService;

    @GetMapping("/noticeList")
    public String NoticeList(@ModelAttribute("noticeDto") NoticeDto noticeDto,
                             @RequestParam(required = false, defaultValue = "1") int curPage,
                             Model model) throws Exception {

        // 전체 게시글 개수
        int listCnt = noticeService.getNoticeListCnt(noticeDto);

        Pagination pagination = new Pagination(listCnt, curPage);

        noticeDto.setStartIndex(pagination.getStartIndex());
        noticeDto.setCntPerPage(pagination.getPageSize());
        noticeDto.setCurPage(pagination.getCurPage());

        List<NoticeDto> notice = noticeService.getNoticeList(noticeDto);

        model.addAttribute("notice", notice);
        model.addAttribute("pagination", pagination);

        return "notice/noticeList";
    }

    // 2. 게시글 상세보기
    @SneakyThrows
    @GetMapping(value = "/noticeview")
    public String pageDetail(@RequestParam int NoticeId, Model model) {
        NoticeDto noticeDto = noticeService.pageDetail(NoticeId);
        model.addAttribute("noticeDto", noticeDto);
        return "notice/noticeview";
    }

    // 3.관리자 글쓰기
    @GetMapping(value="/notice_write")
    public String check(){
        return "notice/notice_write";
    }

    @PostMapping(value = "insert.do")
    public String insert(NoticeDto noticeDto) throws Exception {

        noticeService.insert(noticeDto);

        return "redirect:/notice/noticeList";
    }

    // 4. 게시글 수정
    @GetMapping(value = "/modify")
    public String update(@RequestParam(value = "noticeId") int noticeId, Model model) throws Exception {
        NoticeDto noticeDto = noticeService.pageModifyDetail(noticeId);
        model.addAttribute("noticeDto", noticeDto);
        return "/notice/modify";
    }

    @PostMapping(value = "update.do")
    public String updateDo(NoticeDto noticeDto, Model model,
                           @RequestParam(value = "NoticeId") int noticeId,
                           @RequestParam(defaultValue = "1") int curPage) throws Exception {

        int listCnt = noticeService.getNoticeListCnt(noticeDto);

        Pagination pagination = new Pagination(listCnt, curPage);

        noticeDto.setStartIndex(pagination.getStartIndex());
        noticeDto.setCntPerPage(pagination.getPageSize());
        noticeDto.setCurPage(pagination.getCurPage());

        noticeService.update(noticeDto);

        model.addAttribute("notice", noticeService.getNoticeList(noticeDto));
        model.addAttribute("pagination", pagination);

        System.out.println(noticeService.pageModifyDetail(noticeId));
        return "redirect:/notice/noticeList";
    }

    // 5. 게시글 삭제
    @SneakyThrows
    @RequestMapping(value = "delete.do", method = RequestMethod.POST)
    public String delete(@RequestParam(value = "noticeId", required = false) int noticeId) {
        noticeService.delete(noticeId);

        return "redirect:/notice/noticeList?curPage=1";
    }

    @SneakyThrows
    @RequestMapping(value = "delete.do", method = RequestMethod.GET)
    public void getDelete(HttpServletResponse response) {
        response.setContentType("text/html; charset=UTF-8");

        PrintWriter out = response.getWriter();

        out.println("<script>alert('올바르지 않은 접근입니다'); location.href='/notice/noticeList'</script>");
        out.flush();
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
}
