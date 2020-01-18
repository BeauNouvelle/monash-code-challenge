//
//  UserHeaderView.swift
//  monash-code-challenge
//
//  Created by Beau Nouvelle on 18/1/20.
//  Copyright © 2020 beanunouvelle. All rights reserved.
//

import Foundation
import UIKit

final class UserHeaderView: UIView {

    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let notificationsButton = UIButton()
    let profileButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    @available(iOS, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        addSubview(nameLabel)
        addSubview(dateLabel)
        addSubview(notificationsButton)
        addSubview(profileButton)

        applyNameLabelConstraints()
        applyDateLabelConstraints()
        applyNoficationsButtonContraints()
        applyProfileButtonContraints()

        nameLabel.font = .preferredFont(forTextStyle: .title2)

        dateLabel.font = .preferredFont(forTextStyle: .footnote)
        dateLabel.textColor = .gray

        notificationsButton.setImage(#imageLiteral(resourceName: "notificationIcon"), for: .normal)
        notificationsButton.tintColor = .black

        profileButton.setImage(#imageLiteral(resourceName: "profileIcon"), for: .normal)
        profileButton.tintColor = .black
    }

}

// MARK: Constraints
extension UserHeaderView {
    private func applyNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8)
        ]
        NSLayoutConstraint.activate(nameLabelConstraints)
    }

    private func applyDateLabelConstraints() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        let dateLabelConstraints = [
            dateLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8)
        ]
        NSLayoutConstraint.activate(dateLabelConstraints)
    }

    private func applyNoficationsButtonContraints() {
        notificationsButton.translatesAutoresizingMaskIntoConstraints = false
        let notificationsButtonConstraints = [
            notificationsButton.trailingAnchor.constraint(equalTo: profileButton.leadingAnchor, constant: 8),
            notificationsButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            notificationsButton.heightAnchor.constraint(equalToConstant: 50),
            notificationsButton.widthAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(notificationsButtonConstraints)
    }

    private func applyProfileButtonContraints() {
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        let profileButtonConstraints = [
            profileButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8),
            profileButton.widthAnchor.constraint(equalToConstant: 50),
            profileButton.heightAnchor.constraint(equalToConstant: 50),
            profileButton.centerYAnchor.constraint(equalTo: notificationsButton.centerYAnchor)
        ]
        NSLayoutConstraint.activate(profileButtonConstraints)
    }
}
