//
//  UITableView+Dequeue.swift
//  monash-code-challenge
//
//  Created by Beau Nouvelle on 18/1/20.
//  Copyright © 2020 beanunouvelle. All rights reserved.
//

import UIKit

extension UITableView {
    public func dequeue<T: UITableViewCell>(cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Error: cell with id: \(cellClass.reuseIdentifier) for indexPath: \(indexPath) is not \(T.self)")
        }
        return cell
    }
}
