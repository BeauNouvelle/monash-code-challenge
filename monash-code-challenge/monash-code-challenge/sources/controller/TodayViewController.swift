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
        loadContent()
    }

    private func setupSubviews() {
        view.backgroundColor = .backgroundColor
        tableView.backgroundColor = .backgroundColor

        view.addSubview(tableView)
        applyTableViewContraints()
        registerTableViewCells()

        tableView.delegate = self
        tableView.dataSource = self
    }

    private func registerTableViewCells() {
        tableView.register(cellClass: EventTableViewCell.self)
        tableView.register(cellClass: ParkingTableViewCell.self)
        tableView.register(cellClass: PublicTransportTableViewCell.self)
    }

    private func loadContent() {
        ScheduleService.schedule { (result) in
            print(result)
        }
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
