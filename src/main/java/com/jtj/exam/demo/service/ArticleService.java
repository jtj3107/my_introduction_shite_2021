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

	public List<Article> getForPrintArticles(int boardId, String searchKeywordTypeCode, String searchKeyword) {
		List<Article> articles = articleRepository.getForPrintArticles(boardId, searchKeywordTypeCode, searchKeyword);
	
		return articles;
	}

}
