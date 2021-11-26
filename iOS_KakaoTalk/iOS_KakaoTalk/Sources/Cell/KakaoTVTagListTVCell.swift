//
//  KakaoTVTagListTVCell.swift
//  iOS_KakaoTalk
//
//  Created by 김인환 on 2021/11/26.
//

import UIKit

class KakaoTVTagListTVCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier: String = "KakaoTVTableListTVCell"
    
    // MARK: - IBOutlet
    
    @IBOutlet var tagButtonList: [UIButton]!
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setTagButtonList()
        setUI()
    }

    // MARK: - IBAction
    @IBAction func touchTagButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.layer.backgroundColor = UIColor.black.cgColor
            sender.tintColor = UIColor.white
        } else {
            sender.layer.backgroundColor = UIColor.white.cgColor
            sender.tintColor = UIColor.darkGray
        }
    }
    
    func setTagButtonList() {
        tagButtonList.forEach({
            $0.setTitleColor(UIColor.gray1, for: .normal)
            $0.setTitleColor(UIColor.white, for: .selected)
            $0.tintColor = UIColor.darkGray
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray1.cgColor
            $0.layer.cornerRadius = 16
        })
    }
    
    func setUI() {
        backgroundColor = UIColor(rgb: 0xf5f5f5)
    }
}
