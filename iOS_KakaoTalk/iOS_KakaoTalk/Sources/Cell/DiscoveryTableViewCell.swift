//
//  DiscoveryTableViewCell.swift
//  iOS_KakaoTalk
//
//  Created by Yi Joon Choi on 2021/11/26.
//

import UIKit

protocol channelPlusTouch{
    func presentPopUp(index: Int)
}

class DiscoveryTableViewCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var channelDescLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var firstDescLabel: UILabel!
    @IBOutlet weak var firstAuthorLabel: UILabel!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondDescLabel: UILabel!
    @IBOutlet weak var secondAuthorLabel: UILabel!
    
    var delegate : channelPlusTouch?
    var index : Int = 0
    var channelId : Int = 0
    
    @IBAction func presentPopUp(_ sender: Any) {
        delegate?.presentPopUp(index: index)
    }
    
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
        
        let grayLabels = [channelDescLabel, dateLabel, firstAuthorLabel, secondAuthorLabel]
        
        let descLabels = [firstDescLabel, secondDescLabel]
        
        descLabels.forEach{
            $0!.lineBreakMode = .byTruncatingTail
            $0!.numberOfLines = 2
            $0!.textAlignment = .left
        }
        
        grayLabels.forEach{
            $0!.textColor = .gray3
        }
//        background.layer.cornerRadius = 8
//        background.layer.masksToBounds = true
//        background.clipsToBounds = true
    }
}
