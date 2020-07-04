//
//  Binding.swift
//  LingualNumbers
//
//  Created by Aries Yang on 2020/7/4.
//  Copyright © 2020 Aries Yang. All rights reserved.
//

import Foundation
import UIKit

protocol Bindable {
    func configure(_ viewModel: ViewModel?)
}

protocol ViewModel { }

extension UITableViewCell {
    func bind(_ viewModel: ViewModel?) {
        if let bindable = self as? Bindable {
            bindable.configure(viewModel)
        }
    }
}
