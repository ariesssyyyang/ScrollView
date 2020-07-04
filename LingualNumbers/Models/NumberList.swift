//
//  NumberList.swift
//  LingualNumbers
//
//  Created by Aries Yang on 2020/6/28.
//  Copyright © 2020 Aries Yang. All rights reserved.
//

import Foundation

enum Language {
    case english, chinese, japanese, korean, french, spanish

    var tabText: String {
        switch self {
        case .english: return "English"
        case .chinese: return "中文"
        case .japanese: return "日本語"
        case .korean: return "한국어"
        case .french: return "français"
        case .spanish: return "español"
        }
    }

    fileprivate var numbers: [String] {
        switch self {
        case .english:
            return ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
        case .chinese:
            return ["壹", "貳", "參", "肆", "伍", "陸", "柒", "捌", "玖", "拾"]
        case .japanese:
            return ["いち", "に", "さん", "よん", "ご", "ろく", "なな", "はち", "きゅう", "じゅう"]
        case .korean:
            return ["일", "이", "삼", "사", "오", "육", "칠", "팔", "구", "십"]
        case .french:
            return ["un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix"]
        case .spanish:
            return ["cero", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve"]
        }
    }
}

struct NumberList {
    let language: Language
    let numbers: [String]

    init(_ language: Language) {
        self.language = language
        self.numbers = language.numbers
    }
}
