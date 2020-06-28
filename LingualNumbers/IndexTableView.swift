//
//  IndexTableView.swift
//  LingualNumbers
//
//  Created by Aries Yang on 2020/6/28.
//  Copyright © 2020 Aries Yang. All rights reserved.
//

import Foundation
import UIKit

class IndexTableView: UITableView, Indexable {

    let index: Int

    init(index: Int) {
        self.index = index
        super.init(frame: .zero, style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
