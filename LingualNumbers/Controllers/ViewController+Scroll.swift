//
//  ViewController+Scroll.swift
//  LingualNumbers
//
//  Created by Aries Yang on 2020/7/4.
//  Copyright © 2020 Aries Yang. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset
        switch scrollView {
        case numbersView:
            let tabViewBoundY = tabsView.bounds.origin.y
            tabsView.bounds.origin = CGPoint(x: contentOffset.x / 2, y: tabViewBoundY)
            if contentOffset.x < floor(VIEW_WIDTH / 2) {
                numbersView.contentOffset = CGPoint(
                    x: VIEW_WIDTH * CGFloat(viewModel.numberOfLanguages - 2) + contentOffset.x,
                    y: contentOffset.y
                )
            }
            if contentOffset.x > VIEW_WIDTH * CGFloat(viewModel.numberOfLanguages - 2) + ceil(VIEW_WIDTH / 2) {
                numbersView.contentOffset = CGPoint(
                    x: contentOffset.x.truncatingRemainder(dividingBy: VIEW_WIDTH),
                    y: contentOffset.y
                )
            }
        default:
            return
        }
    }
}
