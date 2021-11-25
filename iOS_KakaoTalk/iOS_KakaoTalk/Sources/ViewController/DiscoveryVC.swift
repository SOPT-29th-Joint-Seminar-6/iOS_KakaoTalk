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
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    private func registerXib(){
        newsTableView.register(DiscoveryTableViewCell.nib(), forCellReuseIdentifier: Const.Xib.discoveryTableViewCell)
    }
}

extension DiscoveryVC : UITableViewDelegate{
    
}

extension DiscoveryVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
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
