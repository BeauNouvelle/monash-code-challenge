//
//  UITableViewCell+Identifier.swift
//  monash-code-challenge
//
//  Created by Beau Nouvelle on 18/1/20.
//  Copyright © 2020 beanunouvelle. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {

    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }

}
