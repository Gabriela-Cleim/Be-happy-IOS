//
//  PostsTableViewCell.swift
//  Be happy
//
//  Created by Gabriela Cleim on 18/02/22.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var postagem: UIImageView!
    @IBOutlet weak var descricao: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
