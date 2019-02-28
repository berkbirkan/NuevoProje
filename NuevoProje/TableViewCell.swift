//
//  TableViewCell.swift
//  NuevoProje
//
//  Created by berk birkan on 15.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var body: UILabel!
    
    
    @IBOutlet weak var thumbnailimage: UIImageView!
    
    
    @IBOutlet weak var titletext: UILabel!
    
    
    @IBOutlet weak var index: UILabel!
    
    @IBOutlet weak var fullimage: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

       
    }

}
