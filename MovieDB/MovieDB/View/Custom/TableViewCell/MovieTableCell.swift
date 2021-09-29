//
//  MovieTableCell.swift
//  MovieDB
//
//  Created by Minseok Choi on 9/24/21.
//

import UIKit

class MovieTableCell: UITableViewCell {

    var movie : Movie?
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(){
        movieTitle.text = movie?.title
        moviePopularity.text = movie?.popularity?.description
        movieRating.text = movie?.release_date
        movieImage.imageFromServerURL(movie?.backdrop_path ?? "")
        movieImage.contentMode = .scaleAspectFill
    }

}
