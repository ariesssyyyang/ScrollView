//
//  ViewController.swift
//  LingualNumbers
//
//  Created by Aries Yang on 2020/6/27.
//  Copyright © 2020 Aries Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI
    let tabsView: HorizontalScrollView = HorizontalScrollView()
    let numbersView: HorizontalScrollView = HorizontalScrollView()
    let indicator: UIView = UIView()

    // MARK: - Constant
    var TAB_WIDTH: CGFloat { view.bounds.width / 2 }
    let TAB_HEIGHT: CGFloat = 50
    var PADDING_WIDTH: CGFloat { view.bounds.width / 4 }

    // MARK: - View Model
    let viewModel = MainViewModel([
        NumberList(.english),
        NumberList(.chinese),
        NumberList(.french),
        NumberList(.japanese),
        NumberList(.spanish),
        NumberList(.korean)
    ])

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSubview()
    }
}

private extension ViewController {
    func setupView() {
        view.backgroundColor = .yellow //fixme

        view.addSubview(tabsView)
        tabsView.frame = CGRect(
            x: PADDING_WIDTH, y: UIApplication.shared.statusBarFrame.height,
            width: TAB_WIDTH, height: TAB_HEIGHT
        )
        tabsView.showsHorizontalScrollIndicator = false
        tabsView.isPagingEnabled = true
        tabsView.delegate = self
        tabsView.clipsToBounds = false

        view.addSubview(indicator)
        indicator.frame = CGRect(
            x: PADDING_WIDTH, y: tabsView.frame.maxY - 2,
            width: tabsView.frame.width, height: 2
        )
        indicator.backgroundColor = .red

        view.addSubview(numbersView)
        numbersView.frame = CGRect(
            x: 0, y: tabsView.frame.maxY,
            width: view.bounds.width, height: view.bounds.height - tabsView.frame.maxY
        )
        numbersView.showsHorizontalScrollIndicator = false
        numbersView.isPagingEnabled = true
        numbersView.delegate = self
    }

    func setupSubview() {
        let numberOfLanguages = viewModel.numberOfLanguages
        for index in 0..<numberOfLanguages {
            let label = IndexLabel(index: index)
            label.textAlignment = .center
            label.text = viewModel.title(at: index)
            tabsView.addIndexView(label)

            let tableView = IndexTableView(index: index)
            tableView.register(NumberCell.self, forCellReuseIdentifier: NumberCell.reuseId)
            tableView.dataSource = self
            tableView.delegate = self
            tableView.isScrollEnabled = false
            tableView.allowsSelection = false
            tableView.backgroundColor = .clear
            numbersView.addIndexView(tableView)
        }

        let count = CGFloat(numberOfLanguages)
        tabsView.contentSize = CGSize(
            width: TAB_WIDTH * count, height: TAB_HEIGHT
        )
        numbersView.contentSize = CGSize(
            width: numbersView.frame.width * count, height: numbersView.frame.height
        )
    }
}
