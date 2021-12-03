//
//  ChannelPopUpVC.swift
//  iOS_KakaoTalk
//
//  Created by Yi Joon Choi on 2021/11/26.
//

import UIKit

class ChannelPopUpVC: UIViewController {

    @IBOutlet var background: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var friendLabel: UILabel!
    @IBOutlet weak var channelDescLabel: UILabel!
    
    @IBOutlet weak var explainTitleLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    
    @IBAction func tapToCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func tapToAddChannel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var channelPlusData: [ChannelData?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        background.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        popUpView.layer.cornerRadius = 8
        
        let url = URL(string: channelPlusData[0]?.channelImageURL ?? "")
        let data = try? Data(contentsOf: url!)
        icon.image = UIImage(data: data!)
        channelNameLabel.text = channelPlusData[0]?.channelName
        channelDescLabel.text = channelPlusData[0]?.channelDesc
        friendLabel.text = "친구 " + String(channelPlusData[0]?.friendCount ?? 0)
        let grayLabels = [friendLabel, explainTitleLabel, explainLabel]
        
        grayLabels.forEach{
            $0!.textColor = .gray3
        }
        
        explainLabel.text = "광고와 마케팅 메세지를 카카오톡으로 받아보실 수 있습니다.\n채널의 보드를 My뷰에서 모아볼 수 있습니다."
        explainLabel.lineBreakMode = .byWordWrapping
        explainLabel.numberOfLines = 3
        explainLabel.textAlignment = .left
        
        channelDescLabel.textColor = .systemGray
        channelDescLabel.lineBreakMode = .byWordWrapping
        channelDescLabel.numberOfLines = 2
        channelDescLabel.textAlignment = .left
    }

}
