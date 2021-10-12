package com.jtj.exam.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jtj.exam.demo.service.ArticleService;
import com.jtj.exam.demo.service.BoardService;
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
		
		List<Article> articles = articleService.getForPrintArticles(boardId, searchKeywordTypeCode, searchKeyword);
		
		model.addAttribute("board", board);
		model.addAttribute("articles", articles);
		
		return "usr/article/list";
	}

}
