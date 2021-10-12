package com.jtj.exam.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jtj.exam.demo.service.ArticleService;
import com.jtj.exam.demo.service.BoardService;
import com.jtj.exam.demo.util.Ut;
import com.jtj.exam.demo.vo.Article;
import com.jtj.exam.demo.vo.Board;
import com.jtj.exam.demo.vo.Rq;

@Controller
public class UsrArticleController {
	private BoardService boardService;
	private ArticleService articleService;
	private Rq rq;
	
	public UsrArticleController(ArticleService articleService, BoardService boardService, Rq rq) {
		this.boardService = boardService;
		this.articleService = articleService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/article/list")
	public String showList(Model model, @RequestParam(defaultValue = "0") int boardId,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "1") int page) {
		Board board = boardService.getBoardById(boardId);
		
		if(board == null) {
			return rq.historyBackJsOnView(Ut.f("`%d`번 게시판은 존재하지 않습니다.", boardId));
		}
		
		int articlesCount = articleService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
		
		int itemsCountInAPage = 10;
		int pageCount = (int)Math.ceil((double)articlesCount / itemsCountInAPage);
		List<Article> articles = articleService.getForPrintArticles(boardId, searchKeywordTypeCode, searchKeyword, itemsCountInAPage, page);
		
		model.addAttribute("page", page);
		model.addAttribute("board", board);
		model.addAttribute("boardId", boardId);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("articlesCount", articlesCount);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("articles", articles);
		
		return "usr/article/list";
	}

}
