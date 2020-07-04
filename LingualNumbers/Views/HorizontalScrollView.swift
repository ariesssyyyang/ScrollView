//
//  HorizontalScrollView.swift
//  LingualNumbers
//
//  Created by Aries Yang on 2020/6/28.
//  Copyright © 2020 Aries Yang. All rights reserved.
//

import Foundation
import UIKit

class HorizontalScrollView: UIScrollView {

    private(set) var views: [Indexable] = []

    func addIndexView(_ view: Indexable) {
        views.append(view)
        addSubview(view)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let width = frame.width
        let height = frame.height
        views.forEach { (view) in
            view.frame = CGRect(
                x: CGFloat(view.index) * width, y: view.expectMinY ?? 0,
                width: width, height: height - (view.expectMinY ?? 0)
            )
        }
    }
}
