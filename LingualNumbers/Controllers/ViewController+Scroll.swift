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
        case tabsView:
            print("👻 tabsview didscroll")
        case numbersView:
            let tabViewBoundY = tabsView.bounds.origin.y
            tabsView.bounds.origin = CGPoint(x: contentOffset.x / 2, y: tabViewBoundY)
        default:
            return
        }
    }
}
