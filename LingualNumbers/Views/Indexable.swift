//
//  Indexable.swift
//  LingualNumbers
//
//  Created by Aries Yang on 2020/6/28.
//  Copyright © 2020 Aries Yang. All rights reserved.
//

import Foundation
import UIKit

protocol Indexable: UIView {
    var index: Int { get }
    var expectMinY: CGFloat? { get }
}
