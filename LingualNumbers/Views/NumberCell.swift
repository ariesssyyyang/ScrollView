//
//  NumberCell.swift
//  LingualNumbers
//
//  Created by Aries Yang on 2020/7/4.
//  Copyright © 2020 Aries Yang. All rights reserved.
//

import Foundation
import UIKit

class NumberCell: UITableViewCell {

}

extension NumberCell: Bindable {
    func configure(_ viewModel: ViewModel?) {
        guard let viewModel = viewModel as? CellViewModel else { return }
        textLabel?.textAlignment = .center
        textLabel?.text = viewModel.text
        backgroundColor = .clear
        // Configuration
    }
}
