//
//  ArticleViewModel.swift
//  NYTarticleDemo
//
//  Created by Minseok Choi on 10/15/21.
//

import Foundation

class ArticleViewModel {

    typealias CompletionHandler = (()->())?
    
    private var result = [Article]()
    func getDataFromServer(completionHandler: CompletionHandler) {
        APIHandler.shared.get(url: URL.init(string: Constant.ARTICLE_URL.rawValue)!) { arr in
            self.result = arr ?? []
            completionHandler?()
        }
    }
    
    func getDataArray()->[Article] {
       return result
    }
    
    func getRowCount()-> Int {
        return result.count
    }
    func getTitle(index:Int)->String {
        return result[index].title ?? ""
    }
    func getByline(index: Int) -> String {
        return result[index].byline ?? ""
    }
    func getUrl(index: Int) -> String {
        return result[index].url ?? ""
    }
    func getUri(index: Int) -> String {
        return result[index].uri ?? ""
    }
    func getDate(index: Int) -> String {
        return result[index].published_date ?? ""
    }
    func getAbstract(index: Int) -> String {
        return result[index].abstract ?? ""
    }
    
}
