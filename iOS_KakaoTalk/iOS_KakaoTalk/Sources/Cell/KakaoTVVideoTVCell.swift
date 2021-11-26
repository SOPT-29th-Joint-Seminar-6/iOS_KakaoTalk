//
//  KakaoTVVideoTVCell.swift
//  iOS_KakaoTalk
//
//  Created by 김인환 on 2021/11/26.
//

import UIKit

class KakaoTVVideoTVCell: UITableViewCell {
    
    // MARK: - Properties
    
    static var identifier: String = "KakaoTVVideoCell"

    // MARK: - IBOutlet
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoDescriptionLabel: UILabel!
    @IBOutlet weak var channelTitleLabel: UILabel!
    @IBOutlet weak var channelDescriptionLabel: UILabel!
    
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
