//
//  APIHandler.swift
//  NYTarticleDemo
//
//  Created by Minseok Choi on 10/15/21.
//

import Foundation

protocol ArticleModelProtocol {
    func retrieveArticles(articles:[Article])
}

class APIHandler {
    static let shared = APIHandler.init()
    
    typealias CompletionHandler = (([Article]?)->())?
    
    private init(){}
    
    func get(url:URL, completionHandler: CompletionHandler) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            let model = try? JSONDecoder().decode(ArticleService.self, from: data!)
            completionHandler?(model?.results)
        }.resume()
    }
    

}

