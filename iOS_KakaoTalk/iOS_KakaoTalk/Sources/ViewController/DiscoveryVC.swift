//
//  DiscoveryVC.swift
//  iOS_KakaoTalk
//
//  Created by 김인환 on 2021/11/18.
//

import UIKit

class DiscoveryVC: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        registerXib()
    }

    private func setUI(){
        if #available(iOS 15, *) {
            newsTableView.sectionHeaderTopPadding = 1
        }
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.backgroundColor = .lightGray
        newsTableView.layer.cornerRadius = 8
    }
    
    private func registerXib(){
        newsTableView.register(DiscoveryTableViewCell.nib(), forCellReuseIdentifier: Const.Xib.discoveryTableViewCell)
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
        headerView.backgroundColor = .systemBrown
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: Const.Xib.discoveryTableViewCell, for: indexPath) as? DiscoveryTableViewCell else {
            return UITableViewCell()
        }
        return newsCell
    }
    
    
}
