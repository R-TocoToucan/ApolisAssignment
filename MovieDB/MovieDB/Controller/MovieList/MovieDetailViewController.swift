//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by Minseok Choi on 9/29/21.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var movie : Movie?
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieImage.contentMode = .scaleAspectFit
        setupDetail()
        // Do any additional setup after loading the view.
    }
    
    func setupDetail() {
        movieTitle.text = movie?.title
        moviePopularity.text = "Popularity: \(movie?.popularity ?? 0)"
        movieOverview.text = movie?.overview
        movieReleaseDate.text = "Release Date: \(movie?.release_date ?? "")"
        movieImage.imageFromServerURL(movie?.backdrop_path ?? "")
        movieImage.contentMode = .scaleAspectFill
    }
    

}
