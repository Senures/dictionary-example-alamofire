//
//  DictionaryCell.swift
//  turkishDictionary
//
//  Created by SEMANUR ESERLER on 29.03.2023.
//

import UIKit



class DictionaryCell: UITableViewCell {

  
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var anlamLabel: UILabel!
    @IBOutlet weak var iconButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
