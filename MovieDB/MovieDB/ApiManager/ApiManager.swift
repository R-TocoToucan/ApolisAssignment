//
//  ApiManager.swift
//  MovieDB
//
//  Created by Minseok Choi on 9/27/21.
//

import UIKit

protocol MovieModelProtocol {
    func receieveData(data:[Movie])
}

class ApiManager {
    
    static let shared = ApiManager()
    
    var delegate : MovieModelProtocol?
    
    func getMovieListFromServer(url: String) {
        
        let session = URLSession.shared
        let datatask = session.dataTask(with: URL.init(string: url)!) {
            data, response, error in
            guard let data = data else {return}
            
            // Jsondecoder convert data into model object directly using decode method
            let jsondecoder = JSONDecoder()
            let movieList = try! jsondecoder.decode(MovieListModel.self, from: data)
            self.delegate?.receieveData(data: movieList.results!)
        }.resume()
    }
    
    
    /*
     
     
     func getMovieListFromServer(url: String, completionHandler  : @escaping ((MovieListModel?)->()) ) {
        
        let objUrlSession = URLSession.shared
        objUrlSession.dataTask(with: URL.init(string: url)!) { data, response, error in
            
                       guard let data = data else {return}
            
                       // Jsondecoder convert data into model object directly using decode method
                       let jsondecoder = JSONDecoder()
                       let movieList = try! jsondecoder.decode(MovieListModel.self, from: data)
            
            completionHandler(movieList)
            }.resume()
        
    }
 */

}
