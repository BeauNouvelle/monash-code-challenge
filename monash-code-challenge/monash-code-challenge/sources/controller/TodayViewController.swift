//
//  TodayViewController.swift
//  monash-code-challenge
//
//  Created by Beau Nouvelle on 18/1/20.
//  Copyright © 2020 beanunouvelle. All rights reserved.
//

import Foundation
import UIKit

final class TodayViewController: UIViewController {

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }

    private func setupSubviews() {
        view.backgroundColor = #colorLiteral(red: 0.9724641442, green: 0.9726034999, blue: 0.9763546586, alpha: 1)

        view.addSubview(tableView)
        applyTableViewContraints()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension TodayViewController: UITableViewDelegate {

}

extension TodayViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


}

// MARK: Constraints
extension TodayViewController {
    // I usually use something like SnapKit to do layout in code,
    // however, to keep dependencies out of this challenge, I'm going with regular layout anchors.
    private func applyTableViewContraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tableViewContraints = [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(tableViewContraints)
    }
}
