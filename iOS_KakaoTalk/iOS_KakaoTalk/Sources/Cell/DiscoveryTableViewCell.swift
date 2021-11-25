//
//  DiscoveryTableViewCell.swift
//  iOS_KakaoTalk
//
//  Created by Yi Joon Choi on 2021/11/26.
//

import UIKit

class DiscoveryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DiscoveryTableViewCell", bundle: Bundle(for: DiscoveryTableViewCell.self))
    }
    
}
