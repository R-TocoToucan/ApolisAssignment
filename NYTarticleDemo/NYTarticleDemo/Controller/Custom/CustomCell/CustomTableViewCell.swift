//
//  CustomTableViewCell.swift
//  NYTarticleDemo
//
//  Created by Minseok Choi on 10/15/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    static let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var articleByline: UILabel!
        
    var article : Article?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
    }
        
    func setupCell() {
        articleImage.imageFromServerURL(article?.uri ?? "")
        articleTitle.text = article?.title
        articleByline.text = article?.byline
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: article?.published_date ?? "")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let str = dateFormatter.string(from: date!)
        
        articleDate.text = str
        articleImage.contentMode = .scaleAspectFill
        articleImage.layer.cornerRadius = 8
    }
        
}
