//
//  ViewVC.swift
//  iOS_KakaoTalk
//
//  Created by Yi Joon Choi on 2021/11/13.
//

import UIKit

class ViewVC: UIViewController {
    // MARK: - Properties
    let viewSizeWidth : CGFloat = UIScreen.main.bounds.width
    let customTabbarTitles: [String] = ["발견", "카카오TV", "잔여백신", "코로나19"]
    
    // MARK: - IBOutlet
    @IBOutlet weak var customTabbarCollectionView: UICollectionView!
    @IBOutlet weak var indicatorLine: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackViewWidth: NSLayoutConstraint!

    @IBOutlet weak var indicatorLineWidth: NSLayoutConstraint!
    @IBOutlet weak var indicatorLineLeading: NSLayoutConstraint!
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCustomTabbarCollectionView()
        setStackViewWidth()
        setScrollView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustIndicatorLineForTabbarCell(at: scrollView.contentOffset.x)
    }
    
    func setCustomTabbarCollectionView() {
        customTabbarCollectionView.register(UINib(nibName: "CustomTabbarCell", bundle: Bundle.main), forCellWithReuseIdentifier: CustomTabbarCell.identifier)
        customTabbarCollectionView.dataSource = self
        customTabbarCollectionView.delegate = self
    }
    
    func setStackViewWidth() {
        stackViewWidth.constant = viewSizeWidth
    }
    
    func setScrollView() {
        scrollView.delegate = self
    }
    
}

extension ViewVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CustomTabbarCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTabbarCell.identifier, for: indexPath) as? CustomTabbarCell else { return UICollectionViewCell() }
        
        cell.tabLabel.text = customTabbarTitles[indexPath.item]
        
        return cell
    }
    
    private func adjustIndicatorLineForTabbarCell(at Offset: CGFloat) {
        let nowScrollOffset = Offset / viewSizeWidth
//
        guard let leftTabbarCell = customTabbarCollectionView.cellForItem(at: IndexPath(item: Int(nowScrollOffset), section: 0)),
        let rightTabbarCell = customTabbarCollectionView.cellForItem(at: IndexPath(item: Int(nowScrollOffset) + 1, section: 0)) else { return }

        let progressPercentage = nowScrollOffset - CGFloat(Int(nowScrollOffset))

        let leftTabbarCellWidth = leftTabbarCell.frame.width
        let rightTabbarCellWidth = rightTabbarCell.frame.width

        let indicatorWidth = (rightTabbarCellWidth - leftTabbarCellWidth) * progressPercentage + leftTabbarCellWidth

        let leftTabbarCellX = leftTabbarCell.frame.origin.x
        let rightTabbarCellX = rightTabbarCell.frame.origin.x
        let indicatorX = (rightTabbarCellX - leftTabbarCellX) * progressPercentage + leftTabbarCellX

        indicatorLineLeading.constant = indicatorX + customTabbarCollectionView.frame.origin.x
        indicatorLineWidth.constant = indicatorWidth
    }
    
}

extension ViewVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
        case 1:
            scrollView.setContentOffset(CGPoint(x: viewSizeWidth * 1, y: 0.0), animated: true)
        case 2:
            scrollView.setContentOffset(CGPoint(x: viewSizeWidth * 2, y: 0.0), animated: true)
        case 3:
            scrollView.setContentOffset(CGPoint(x: viewSizeWidth * 3, y: 0.0), animated: true)
        default:
            break
        }
    }
}

extension ViewVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("asdasdasd")
        adjustIndicatorLineForTabbarCell(at: scrollView.contentOffset.x)
    }
}
