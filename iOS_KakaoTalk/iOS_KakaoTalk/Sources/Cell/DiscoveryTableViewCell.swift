//
//  DiscoveryTableViewCell.swift
//  iOS_KakaoTalk
//
//  Created by Yi Joon Choi on 2021/11/26.
//

import UIKit

class DiscoveryTableViewCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var channelDescLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var firstDescLabel: UILabel!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondDescLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DiscoveryTableViewCell", bundle: Bundle(for: DiscoveryTableViewCell.self))
    }
    
    private func setUI(){
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.masksToBounds = true
//        background.layer.cornerRadius = 8
//        background.layer.masksToBounds = true
//        background.clipsToBounds = true
    }
}
