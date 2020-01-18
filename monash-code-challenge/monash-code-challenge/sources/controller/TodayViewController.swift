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

    private let userHeaderView = UserHeaderView()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private var schedule: Schedule? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        loadContent()
    }

    private func setupSubviews() {
        view.backgroundColor = .backgroundColor
        tableView.backgroundColor = .clear

        view.addSubview(userHeaderView)
        applyUserHeaderViewConstraints()
        setupUserHeaderContent()
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
        ScheduleService.schedule { [weak self] (result) in
            switch result {
            case .failure(let error):
                self?.show(error: error)
            case .success(let schedule):
                self?.schedule = schedule
            }
        }
    }

    private func setupUserHeaderContent() {
        let usersName = "Kier" // should be pulled from user on server.
        userHeaderView.nameLabel.text = "Hey, \(usersName)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d/MM EEEE, 'Week' W"
        userHeaderView.dateLabel.text = dateFormatter.string(from: Date())
    }

    private func show(error: HTTPError) {
        let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    override func viewDidLayoutSubviews() {
        let topInset =  userHeaderView.frame.height
        tableView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
    }

}

extension TodayViewController: UITableViewDelegate {

}

extension TodayViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int?

        if section == 0 {
            count = schedule?.todaysEvents?.count
        } else if section == 1 {
            count = schedule?.parking?.count
        } else if section == 2 {
            count = schedule?.publicTransport?.count
        }

        return count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0, let event = schedule?.todaysEvents?[indexPath.row] {
            let cell = tableView.dequeue(cellClass: EventTableViewCell.self, forIndexPath: indexPath)
            cell.event = event
            return cell
        }
        return UITableViewCell()
    }

}

// MARK: Constraints
extension TodayViewController {
    // I usually use something like SnapKit to do layout in code,
    // however, to keep dependencies out of this challenge, I'm going with regular layout anchors.
    private func applyTableViewContraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tableViewContraints: [NSLayoutConstraint] = [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(tableViewContraints)
    }

    private func applyUserHeaderViewConstraints() {
        userHeaderView.translatesAutoresizingMaskIntoConstraints = false
        let userHeaderViewConstraints = [
            userHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            userHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            userHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(userHeaderViewConstraints)
    }
}
