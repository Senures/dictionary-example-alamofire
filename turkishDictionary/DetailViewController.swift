//
//  DetailViewController.swift
//  turkishDictionary
//
//  Created by SEMANUR ESERLER on 30.03.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var labeldetail: UILabel!
    
 
    @IBOutlet weak var kelimeLabel: UILabel!
   
    
    var id : String?
    
    var gelenKelime : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        labeldetail.text = gelenKelime
        kelimeLabel.text = id
        
    }
    


}
