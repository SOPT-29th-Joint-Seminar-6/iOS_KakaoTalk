//
//  DiscoveryVC.swift
//  iOS_KakaoTalk
//
//  Created by 김인환 on 2021/11/18.
//

import UIKit

class DiscoveryVC: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    // MARK: - Properties
    var viewFindData: [ViewFindData]?
    var data : [ChannelResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        registerXib()
        requestViewFindData()
        initData()
    }

    private func setUI(){
        if #available(iOS 15, *) {
            newsTableView.sectionHeaderTopPadding = 0
        }
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.backgroundColor = .systemGray6
        newsTableView.layer.cornerRadius = 8
    }
    
    private func registerXib(){
        newsTableView.register(DiscoveryTableViewCell.nib(), forCellReuseIdentifier: Const.Xib.discoveryTableViewCell)
        newsTableView.register(DiscoverySecondTableViewCell.nib(), forCellReuseIdentifier: Const.Xib.discoverySecondTableViewCell)
    }
    
    func requestViewFindData() {
        ViewFindService.shared.getThumbnail { data in
            guard let data = data else { return }
            self.viewFindData = data.data
            self.viewFindData?.sort(by: {$0.id < $1.id})
            self.newsTableView.reloadData()
        }
    }
    
    private func initData(){
        data.append(ChannelResponse(Icon: UIImage(named: "icMovie")!, ChannelName: "오늘의 영화계 소식", ChannelDesc: "영화계 이모저모를 모아봤습니다.",
                                    Date: "2시간 전", firstImage: UIImage(named: "imgMovie1")!, firstDesc: "유아인X이재인X안재홍X라미란X김희원, 초능력 갖...",
                                    firstAuthor: "", secondImage: UIImage(named: "imgMovie2")!, secondDesc: "김혜수, 28회째 청룡영화상진행... 유연석과 4년 연속...", secondAuthor: ""))
        data.append(ChannelResponse(Icon: UIImage(named: "imgNewspaper")!, ChannelName: "경기연합신문", ChannelDesc: "백신 접종 이상 반응... 치료제가 답인가?",
                                    Date: "19시간 전", firstImage: UIImage(named: "imgVaccin")!, firstDesc: "광주교도소 20대 재소자, 모더나 접종 이틀 후 사망",
                                    firstAuthor: "경기연합신문", secondImage: UIImage(named: "imgModuna")!, secondDesc: "모더나 맞고 물 한 모금 못 마시고 초록물 토하는 50대 남성..", secondAuthor: "경기연합신문"))
        data.append(ChannelResponse(Icon: UIImage(named: "imgNewspaper")!, ChannelName: "경기연합신문", ChannelDesc: "백신 접종 이상 반응... 치료제가 답인가?",
                                    Date: "19시간 전", firstImage: UIImage(named: "imgVaccin")!, firstDesc: "광주교도소 20대 재소자, 모더나 접종 이틀 후 사망",
                                    firstAuthor: "경기연합신문", secondImage: UIImage(named: "imgModuna")!, secondDesc: "모더나 맞고 물 한 모금 못 마시고 초록물 토하는 50대 남성..", secondAuthor: "경기연합신문"))
    }
}

extension DiscoveryVC : UITableViewDelegate{
    
}

extension DiscoveryVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemGray6
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewFindData?.count ?? 2
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        else{
            return 15
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 337
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0:
            
            guard let newsCell = tableView.dequeueReusableCell(withIdentifier: Const.Xib.discoveryTableViewCell, for: indexPath) as? DiscoveryTableViewCell else {
                return UITableViewCell()
            }
            
            newsCell.delegate = self
            newsCell.index = indexPath.section
            
            newsCell.icon.image = data[indexPath.section].Icon
            newsCell.channelNameLabel.text = viewFindData?[indexPath.section].channelName
            newsCell.channelDescLabel.text = viewFindData?[indexPath.section].channelDesc
            newsCell.dateLabel.text = viewFindData?[indexPath.section].createAt
            
            newsCell.firstDescLabel.text = viewFindData?[indexPath.section].articles[0].title
            newsCell.secondDescLabel.text = viewFindData?[indexPath.section].articles[1].title
            
            newsCell.firstImageView.image = data[indexPath.section].firstImage
            newsCell.secondImageView.image = data[indexPath.section].secondImage
            
            return newsCell
        default:
            guard let newsCell = tableView.dequeueReusableCell(withIdentifier: Const.Xib.discoverySecondTableViewCell, for: indexPath) as? DiscoverySecondTableViewCell else {
                return UITableViewCell()
            }
            
            newsCell.delegate = self
            newsCell.index = indexPath.section
            
            newsCell.icon.image = data[indexPath.section].Icon
            newsCell.channelNameLabel.text = viewFindData?[indexPath.section].channelName
            newsCell.titleLabel.text = viewFindData?[indexPath.section].channelDesc
            newsCell.dateLabel.text = viewFindData?[indexPath.section].createAt
            
            newsCell.firstDescLabel.text = viewFindData?[indexPath.section].articles[0].title
            newsCell.firstAuthorLabel.text = viewFindData?[indexPath.section].articles[0].writer
            newsCell.secondDescLabel.text = viewFindData?[indexPath.section].articles[1].title
            newsCell.secondAuthorLabel.text = viewFindData?[indexPath.section].articles[1].writer
            
            newsCell.firstImage.image = data[indexPath.section].firstImage
            newsCell.secondImage.image = data[indexPath.section].secondImage
            
            return newsCell
        }
    }
}

extension DiscoveryVC : channelPlusTouch{
    func presentPopUp(index: Int) {
        guard let nextVC = UIStoryboard.init(name: Const.Storyboard.channelPopUp, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.channelPopUpVC) as? ChannelPopUpVC else { return }
        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.modalTransitionStyle = .crossDissolve
        self.present(nextVC, animated: true, completion: nil)
    }
}

