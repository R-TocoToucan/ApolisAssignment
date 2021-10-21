//
//  CustomTableViewCell.swift
//  Lululemon
//
//  Created by Minseok Choi on 10/13/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCreationTime: UILabel!
    
    var garment : Garment?
    static let identifier = "GarmentCell"
    static var nib: UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell() {
        lblName.text = garment?.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let date = dateFormatter.string(from: garment?.creationTime ?? Date())
        print(date)
        lblCreationTime.text = date
        
    }
    
}
