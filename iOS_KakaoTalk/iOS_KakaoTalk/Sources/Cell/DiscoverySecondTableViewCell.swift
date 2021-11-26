//
//  DiscoverySecondTableViewCell.swift
//  iOS_KakaoTalk
//
//  Created by Yi Joon Choi on 2021/11/26.
//

import UIKit

class DiscoverySecondTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var firstDescLabel: UILabel!
    @IBOutlet weak var firstAuthorLabel: UILabel!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var secondDescLabel: UILabel!
    @IBOutlet weak var secondAuthorLabel: UILabel!
    
    @IBAction func presentPopUp(_ sender: Any) {
        delegate?.presentPopUp(index: index)
    }
    
    var delegate : channelPlusTouch?
    var index : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DiscoverySecondTableViewCell", bundle: Bundle(for: DiscoverySecondTableViewCell.self))
    }
    
    private func setUI(){
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.masksToBounds = true
        
        let grayLabels = [dateLabel, firstAuthorLabel, secondAuthorLabel]
        
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
