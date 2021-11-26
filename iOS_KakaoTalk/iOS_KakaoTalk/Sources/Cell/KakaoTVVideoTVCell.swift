//
//  KakaoTVVideoTVCell.swift
//  iOS_KakaoTalk
//
//  Created by 김인환 on 2021/11/26.
//

import UIKit

class KakaoTVVideoTVCell: UITableViewCell {
    
    // MARK: - Properties
    
    static var identifier: String = "KakaoTVVideoTVCell"

    // MARK: - IBOutlet

    @IBOutlet var cellContentsView: UIView!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoDescriptionLabel: UILabel!
    @IBOutlet weak var channelIconImageView: UIImageView!
    @IBOutlet weak var channelTitleLabel: UILabel!
    @IBOutlet weak var channelDescriptionLabel: UILabel!
    
    @IBOutlet var seperatorLine: UIView!
    
    @IBOutlet var informationView: UIView!
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setUI()
    }
    
    func setUI() {
        backgroundColor = UIColor(rgb: 0xf5f5f5)
        seperatorLine.backgroundColor = UIColor(rgb: 0xf5f5f5)
        cellContentsView.layer.cornerRadius = 10
        cellContentsView.layer.masksToBounds = true
        
        videoDescriptionLabel.textColor = UIColor.gray4
        channelDescriptionLabel.textColor = UIColor.gray4
    }
    
}
