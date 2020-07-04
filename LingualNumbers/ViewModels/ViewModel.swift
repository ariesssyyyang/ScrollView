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

    var lingualNumbers: [NumberList] { _numbers }

    init(_ model: [NumberList]) {
        self._numbers = model
    }

}
