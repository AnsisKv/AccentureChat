//
//  MessageCell.swift
//  AccentureChat
//
//  Created by kvelde.niklavs.ansis on 22/05/2023.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var stackViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackViewTrailingConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
