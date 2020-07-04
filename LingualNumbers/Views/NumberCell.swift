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

    let label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        label.textAlignment = .center
        label.textColor = .black
        addSubview(label)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NumberCell: Bindable {
    func configure(_ viewModel: ViewModel?) {
        guard let viewModel = viewModel as? CellViewModel else { return }
        label.text = viewModel.text
        label.frame = contentView.bounds
        backgroundColor = .clear
        // Configuration
    }
}
