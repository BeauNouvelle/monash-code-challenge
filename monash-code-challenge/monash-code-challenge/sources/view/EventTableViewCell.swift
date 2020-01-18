//
//  EventTableViewCell.swift
//  monash-code-challenge
//
//  Created by Beau Nouvelle on 18/1/20.
//  Copyright © 2020 beanunouvelle. All rights reserved.
//

import Foundation
import UIKit

final class EventTableViewCell: UITableViewCell {

    var event: Event? {
        didSet {
            setupContent()
        }
    }

    private let startTimeLabel = UILabel()
    private let endTimeLabel = UILabel()
    private let dividerLine = UIView()
    private let titleLabel = UILabel()
    private let lecturerLabel = UILabel()
    private let locationLabel = UILabel()

    private let horizontalStackView = UIStackView()
    private let leftVerticalStackView = UIStackView()
    private let rightVerticalStackView = UIStackView()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }

    @available(iOS, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        backgroundColor = .white
        contentView.addSubview(horizontalStackView)
        horizontalStackView.alignment = .fill
        horizontalStackView.axis = .horizontal
        applyHorizonalStackViewConstraints()

        leftVerticalStackView.axis = .vertical
        leftVerticalStackView.alignment = .center
        leftVerticalStackView.addArrangedSubview(startTimeLabel)
        leftVerticalStackView.addArrangedSubview(endTimeLabel)
        horizontalStackView.addArrangedSubview(leftVerticalStackView)
        horizontalStackView.addArrangedSubview(dividerLine)
        applyLeftVerticalStackViewConstraints()

        rightVerticalStackView.axis = .vertical
        rightVerticalStackView.addArrangedSubview(titleLabel)
        rightVerticalStackView.addArrangedSubview(lecturerLabel)
        rightVerticalStackView.addArrangedSubview(locationLabel)
        horizontalStackView.addArrangedSubview(rightVerticalStackView)

        dividerLine.backgroundColor = .dividerBlue
        applyDividerConstraints()
    }

    private func setupContent() {
        startTimeLabel.text = event?.startTime
        endTimeLabel.text = event?.endTime

        titleLabel.text = event?.title
        lecturerLabel.text = event?.lecturer
        locationLabel.text = event?.location
    }

    override func prepareForReuse() {
        startTimeLabel.text = nil
        endTimeLabel.text = nil

        titleLabel.text = nil
        lecturerLabel.text = nil
        locationLabel.text = nil
    }

}

extension EventTableViewCell {

    private func applyLeftVerticalStackViewConstraints() {
        leftVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        let stackViewConstraints = [
            leftVerticalStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/3),
            leftVerticalStackView.topAnchor.constraint(equalTo: horizontalStackView.topAnchor, constant: 10),
            leftVerticalStackView.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(stackViewConstraints)
    }

    private func applyHorizonalStackViewConstraints() {
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        let stackViewConstraints = [
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(stackViewConstraints)
    }

    private func applyDividerConstraints() {
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        guard let dividerSuper = dividerLine.superview else { return }
        let dividerConstraints = [
            dividerLine.widthAnchor.constraint(equalToConstant: 2),
            dividerLine.topAnchor.constraint(equalTo: dividerSuper.topAnchor, constant: 10),
            dividerLine.bottomAnchor.constraint(equalTo: dividerSuper.bottomAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(dividerConstraints)
    }
}
