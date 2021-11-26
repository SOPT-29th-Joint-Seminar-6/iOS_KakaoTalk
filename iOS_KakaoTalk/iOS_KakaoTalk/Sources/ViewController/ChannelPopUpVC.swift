//
//  ChannelPopUpVC.swift
//  iOS_KakaoTalk
//
//  Created by Yi Joon Choi on 2021/11/26.
//

import UIKit

class ChannelPopUpVC: UIViewController {

    @IBOutlet var background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        background.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }

}
