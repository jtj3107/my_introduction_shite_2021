package com.jtj.exam.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jtj.exam.demo.repository.ArticleRepository;
import com.jtj.exam.demo.vo.Article;

@Service
public class ArticleService {

	private ArticleRepository articleRepository;
	
	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}

	public List<Article> getForPrintArticles(int boardId, String searchKeywordTypeCode, String searchKeyword, int itemsCountInAPage, int page) {
		int limitStart = (page - 1) * itemsCountInAPage;
		int limitTake = itemsCountInAPage;
		
		List<Article> articles = articleRepository.getForPrintArticles(boardId, limitStart, limitTake, searchKeywordTypeCode, searchKeyword);
	
		return articles;
	}

	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword) {
		return articleRepository.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
	}

}
