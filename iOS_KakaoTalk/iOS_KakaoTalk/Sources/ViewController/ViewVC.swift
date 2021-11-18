//
//  ViewVC.swift
//  iOS_KakaoTalk
//
//  Created by Yi Joon Choi on 2021/11/13.
//

import UIKit

class ViewVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var stackViewWidth: NSLayoutConstraint!
    
    let viewSizeWidth : CGFloat = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackViewWidth.constant = viewSizeWidth
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
