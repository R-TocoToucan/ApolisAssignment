//
//  MovieListViewController.swift
//  MovieDB
//
//  Created by Minseok Choi on 9/24/21.
//

import UIKit

class MovieListViewController: UIViewController, MovieModelProtocol {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var movieListModel : MovieListModel? = MovieListModel()
    var filteredList = [Movie]()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        let apiMgr = ApiManager.shared
        apiMgr.delegate = self
        
        apiMgr.getMovieListFromServer(url: Constant.MOVIE_LIST_URL.rawValue)
        
    }
    func receieveData(data: [Movie]) {
        movieListModel?.results = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
       }

    }

}
extension MovieListViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredList.count
        } else {
            return movieListModel?.results?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "MovieTableCell")  as? MovieTableCell
        var movie : Movie?
        if isSearching {
            movie = filteredList[indexPath.row]
        } else {
            movie = movieListModel?.results?[indexPath.row]
        }
           
        movieCell?.movie = movie
        movieCell?.setupCell()
        
        return movieCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "MovieDetailViewController") as? MovieDetailViewController {
            let movieDetail : Movie?
            if isSearching {
                movieDetail = filteredList[indexPath.row]
            } else {
                movieDetail = movieListModel?.results?[indexPath.row]
            }
            vc.movie = movieDetail
            self.present(vc, animated: true)
        }
    }
    
}

extension MovieListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text == "" {
            isSearching = false
            tableView.reloadData()
        } else {
            filteredList.removeAll()
            isSearching = true
            let searchString: String = searchController.searchBar.text ?? ""
            let movielist = movieListModel?.results
            for i in movielist! {
                if (i.title!.lowercased().contains(searchString.lowercased())) {
                    filteredList.append(i)
                }
            }
            tableView.reloadData()
        }
    }
    
}
