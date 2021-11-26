//
//  ChannelPopUpVC.swift
//  iOS_KakaoTalk
//
//  Created by Yi Joon Choi on 2021/11/26.
//

import UIKit

class ChannelPopUpVC: UIViewController {

    @IBOutlet var background: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var friendLabel: UILabel!
    @IBOutlet weak var channelDescLabel: UILabel!
    
    @IBOutlet weak var explainLabel: UILabel!
    
    @IBAction func tapToCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func tapToAddChannel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        background.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        explainLabel.text = ""
    }

}
