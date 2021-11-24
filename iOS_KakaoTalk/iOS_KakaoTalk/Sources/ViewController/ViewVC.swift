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
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCustomTabbarCollectionView()
        setStackViewWidth()
        setScrollView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustCustomTabbarForTabbarCell(at: scrollView.contentOffset.x)
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

// MARK: - Extensions
extension ViewVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CustomTabbarCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTabbarCell.identifier, for: indexPath) as? CustomTabbarCell else { return UICollectionViewCell() }
        
        cell.tabLabel.text = customTabbarTitles[indexPath.item]
        
        return cell
    }
    
    private func adjustCustomTabbarForTabbarCell(at Offset: CGFloat) {
        let currentScrollOffset = Offset / viewSizeWidth

        guard let leftTabbarCell = customTabbarCollectionView.cellForItem(at: IndexPath(item: Int(currentScrollOffset), section: 0)) as? CustomTabbarCell,
        let rightTabbarCell = customTabbarCollectionView.cellForItem(at: IndexPath(item: Int(currentScrollOffset) + 1, section: 0)) as? CustomTabbarCell else { return }

        let progressPercentage = currentScrollOffset - CGFloat(Int(currentScrollOffset))

        let leftTabbarCellWidth = leftTabbarCell.frame.width
        let rightTabbarCellWidth = rightTabbarCell.frame.width

        let indicatorWidth = (rightTabbarCellWidth - leftTabbarCellWidth) * progressPercentage + leftTabbarCellWidth

        let leftTabbarCellX = leftTabbarCell.frame.origin.x
        let rightTabbarCellX = rightTabbarCell.frame.origin.x
        let indicatorX = (rightTabbarCellX - leftTabbarCellX) * progressPercentage + leftTabbarCellX

        indicatorLineLeading.constant = indicatorX + customTabbarCollectionView.frame.origin.x
        indicatorLineWidth.constant = indicatorWidth
        
//        let currentLeftCellColor = leftTabbarCell.tabLabel.textColor
//        let currentRightCellColor = rightTabbarCell.tabLabel.textColor
//        
//        var currentHue: CGFloat = CGFloat.zero
//        var currentSaturation: CGFloat = CGFloat.zero
//        var currentBrightness: CGFloat = CGFloat.zero
//        var currentAlpha: CGFloat = CGFloat.zero
//        currentLeftCellColor?.getHue(&currentHue, saturation: &currentSaturation, brightness: &currentBrightness, alpha: &currentAlpha)
//        
//        let computedBlack = UIColor(hue: currentHue, saturation: currentSaturation, brightness: currentBrightness * (1 - progressPercentage), alpha: currentAlpha)
//        let computedGray = UIColor(hue: currentHue, saturation: currentSaturation, brightness: currentBrightness * progressPercentage, alpha: currentAlpha)
//        
//        rightTabbarCell.tabLabel.textColor = computedBlack
//        leftTabbarCell.tabLabel.textColor = computedGray
    }
    
}

extension ViewVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setCurrentCustomTabLabelColor(at: indexPath)
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
    
    private func setCurrentCustomTabLabelColor(at indexPath: IndexPath) {
        guard let currentCell: CustomTabbarCell = customTabbarCollectionView.cellForItem(at: indexPath) as? CustomTabbarCell else { return }
        customTabbarCollectionView.visibleCells.forEach({(collectionCell) in
            guard let cell: CustomTabbarCell = collectionCell as? CustomTabbarCell else { return }
            cell.tabLabel.textColor = UIColor.systemGray
        })
        currentCell.tabLabel.textColor = UIColor.black
    }
}

extension ViewVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        adjustCustomTabbarForTabbarCell(at: scrollView.contentOffset.x)
    }
}
