//
//  StudentCell.swift
//  HallPass
//
//  Created by Mitchell Gant on 2/16/17.
//  Copyright © 2017 Mitchell Gant. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    
    @IBOutlet weak var studentName: UILabel!
    var cellStudent:Student?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
