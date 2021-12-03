//
//  KakaoTVVC.swift
//  iOS_KakaoTalk
//
//  Created by 김인환 on 2021/11/18.
//

import UIKit

class KakaoTVVC: UIViewController {
    
    // MARK: - Properties
    var thumbnailData: [ThumbnailData]?
    
    // MARK: - IBOutlet

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        requestThumbnailData()
    }
    
    func setTableView() {
        tableView.register(UINib(nibName: "KakaoTVTagListTVCell", bundle: .main), forCellReuseIdentifier: KakaoTVTagListTVCell.identifier)
        tableView.register(UINib(nibName: "KakaoTVVideoTVCell", bundle: .main), forCellReuseIdentifier: KakaoTVVideoTVCell.identifier)
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
    }
    
    func requestThumbnailData() {
        KakaoTVService.shared.getThumbnail { data in
            guard let data = data else { return }
            self.thumbnailData = data.data
            self.thumbnailData?.sort(by: {$0.id < $1.id})
            self.tableView.reloadData()
        }
    }
}

// MARK: - Extension

extension KakaoTVVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell: KakaoTVTagListTVCell = tableView.dequeueReusableCell(withIdentifier: KakaoTVTagListTVCell.identifier) as? KakaoTVTagListTVCell else { return UITableViewCell() }

            return cell
        case 1...:
            guard let cell: KakaoTVVideoTVCell = tableView.dequeueReusableCell(withIdentifier: KakaoTVVideoTVCell.identifier, for: indexPath) as? KakaoTVVideoTVCell else { return UITableViewCell() }
            
            guard let cellData: ThumbnailData = self.thumbnailData?[indexPath.row - 1] else { return UITableViewCell() }
            
            guard let imageURL: URL = URL(string: cellData.thumbnailImageURL) else { return UITableViewCell() }
            
            do {
                let data: Data = try Data(contentsOf: imageURL)
                let thumbnailImage = UIImage(data: data)
                cell.thumbnailImageView.image = thumbnailImage
            } catch let err{
                print(err.localizedDescription)
            }
            
            cell.videoTitleLabel.text = cellData.title
            cell.videoDescriptionLabel.text = cellData.desc
            cell.channelTitleLabel.text = String(describing: cellData.videochannelID)
            
            switch cellData.id {
            case 2:
                cell.channelTitleLabel.text = "개미는 일하기 싫어 뚠뚠 챕터3"
                cell.channelDescriptionLabel.text = "그냥 다 좋아서 하기 프로젝트"
            default:
                cell.channelTitleLabel.text = "개미는 오늘도 뚠뚠 챕터5"
                cell.channelDescriptionLabel.text = "MZ세대 주식투자 프로젝트"
            }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
}
