//
//  KakaoTVVC.swift
//  iOS_KakaoTalk
//
//  Created by 김인환 on 2021/11/18.
//

import UIKit

class KakaoTVVC: UIViewController {
    
    // MARK: - IBOutlet

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    func setTableView() {
        tableView.register(UINib(nibName: "KakaoTVTagListTVCell", bundle: .main), forCellReuseIdentifier: KakaoTVTagListTVCell.identifier)
        tableView.register(UINib(nibName: "KakaoTVVideoTVCell", bundle: .main), forCellReuseIdentifier: KakaoTVVideoTVCell.identifier)
        tableView.dataSource = self
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
            // Set Data Here.....Later

            return cell
        case 1...:
            guard let cell: KakaoTVVideoTVCell = tableView.dequeueReusableCell(withIdentifier: KakaoTVVideoTVCell.identifier, for: indexPath) as? KakaoTVVideoTVCell else { return UITableViewCell() }
            // Set Data Here.....Later
            
            return cell
        default:
            return UITableViewCell()
        }
    }
}
