//
//  CommentCell.swift
//  NuevoProje
//
//  Created by berk birkan on 15.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var nametext: UILabel!
    
    
    @IBOutlet weak var emailtext: UILabel!
    
    
    @IBOutlet weak var commenttext: UILabel!
    
    
    @IBOutlet weak var bodytext: UILabel!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
