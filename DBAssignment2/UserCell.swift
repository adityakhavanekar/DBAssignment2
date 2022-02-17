//
//  UserCell.swift
//  DBAssignment2
//
//  Created by Neosoft on 07/02/22.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var educationLbl: UILabel!
    
    var name:String = ""
    var education:String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImageView.layer.cornerRadius = userImageView.frame.height/2
        userImageView.clipsToBounds = true
        userImageView.backgroundColor = .white
        
        nameLbl.text = name
        educationLbl.text = education
    }

    

}
