//
//  Article.swift
//  NYTarticleDemo
//
//  Created by Minseok Choi on 10/15/21.
//

import Foundation

struct ArticleService: Codable {
    var num_results: Int?
    var results:[Article]?
}

struct Article: Codable {
    var title: String?
    var abstract: String?
    var url: String?
    var uri: String?
    var byline: String?
    var published_date: String?
}

