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
    let tabsView: UIView = UIView()
    let numbersView: HorizontalScrollView = HorizontalScrollView()
    let indicator: UIView = UIView()
    let tapAreaView: UIView = UIView()

    // MARK: - Constant
    var TAB_WIDTH: CGFloat { view.bounds.width / 2 }
    let TAB_HEIGHT: CGFloat = 50
    var PADDING_WIDTH: CGFloat { view.bounds.width / 4 }

    // MARK: - View Model
    let viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSubview()
        addTapGesture()
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
        tabsView.clipsToBounds = false
        view.addSubview(tapAreaView)
        tapAreaView.frame = tabsView.frame

        view.addSubview(indicator)
        indicator.frame = CGRect(
            x: PADDING_WIDTH, y: tabsView.frame.maxY - 2,
            width: tabsView.frame.width, height: 2
        )
        indicator.backgroundColor = .red

        view.addSubview(numbersView)
        numbersView.frame = CGRect(
            x: 0, y: tabsView.frame.minY,
            width: view.bounds.width, height: view.bounds.height - tabsView.frame.minY
        )
        numbersView.showsHorizontalScrollIndicator = false
        numbersView.isPagingEnabled = true
        numbersView.delegate = self
    }

    func setupSubview() {
        let numberOfLanguages = viewModel.numberOfLanguages
        for index in 0..<numberOfLanguages {
            let label = UILabel(
                frame: CGRect(
                    origin: CGPoint(x: TAB_WIDTH * CGFloat(index), y: 0),
                    size: CGSize(width: TAB_WIDTH, height: TAB_HEIGHT))
            )
            label.textAlignment = .center
            label.text = viewModel.title(at: index)
            tabsView.addSubview(label)

            let tableView = IndexTableView(index: index, expectY: TAB_HEIGHT)
            tableView.register(NumberCell.self, forCellReuseIdentifier: NumberCell.reuseId)
            tableView.dataSource = self
            tableView.delegate = self
            tableView.isScrollEnabled = false
            tableView.allowsSelection = false
            tableView.backgroundColor = .clear
            numbersView.addIndexView(tableView)
        }

        numbersView.contentSize = CGSize(
            width: numbersView.frame.width * CGFloat(numberOfLanguages),
            height: numbersView.frame.height
        )
    }

    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        numbersView.addGestureRecognizer(tap)
    }

    @objc func didTap(_ tap: UITapGestureRecognizer) {
        let point = tap.location(in: tapAreaView)
        guard
            point.y > 0 && point.y < TAB_HEIGHT,
            point.x < 0 || point.x > TAB_WIDTH
            else { return }
        let x: CGFloat
        let y: CGFloat = numbersView.contentOffset.y
        switch point.x {
        case ...0:
            x = numbersView.contentOffset.x - view.frame.width
        case TAB_WIDTH...:
            x = numbersView.contentOffset.x + view.frame.width
        default:
            return
        }
        numbersView.setContentOffset(CGPoint(x: x, y: y), animated: true)
    }
}
