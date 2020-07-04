//
//  ViewModel.swift
//  LingualNumbers
//
//  Created by Aries Yang on 2020/6/28.
//  Copyright © 2020 Aries Yang. All rights reserved.
//

import Foundation

struct ViewModel {
    private let _numbers: [NumberList]

    var numberOfLanguages: Int { _numbers.count }

    init(_ model: [NumberList]) {
        self._numbers = model
    }

    func title(at index: Int) -> String? {
        guard index < numberOfLanguages else { return nil }
        return _numbers[index].language.tabText
    }
}
