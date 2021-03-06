//
//  MainViewModel.swift
//  LingualNumbers
//
//  Created by Aries Yang on 2020/6/28.
//  Copyright © 2020 Aries Yang. All rights reserved.
//

import Foundation

struct MainViewModel {

    private let _numbers: [NumberList]

    var numberOfLanguages: Int { _numbers.count }

    var numberOfNumbers: Int { 10 }

    init() {
        let target = [
            NumberList(.english),
            NumberList(.chinese),
            NumberList(.french),
            NumberList(.japanese),
            NumberList(.spanish),
            NumberList(.korean)
        ]
        let (firstBuffer, lastBuffer) = (target[0], target[target.count - 1])
        self._numbers = [lastBuffer] + target + [firstBuffer]
    }

    func title(at index: Int) -> String? {
        guard index < numberOfLanguages else { return nil }
        return _numbers[index].language.tabText
    }

    func cellViewModel(at index: Int, cellIndex: Int) -> ViewModel? {
        guard
            index < numberOfLanguages,
            cellIndex < numberOfNumbers
            else { return nil }
        return CellViewModel(text: _numbers[index].numbers[cellIndex])
    }
}
