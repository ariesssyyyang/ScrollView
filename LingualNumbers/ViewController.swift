//
//  ViewController.swift
//  LingualNumbers
//
//  Created by Aries Yang on 2020/6/27.
//  Copyright © 2020 Aries Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let viewModel = ViewModel([
        NumberList(.english),
        NumberList(.chinese),
        NumberList(.french),
        NumberList(.japanese),
        NumberList(.spanish),
        NumberList(.korean)
    ])

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}

