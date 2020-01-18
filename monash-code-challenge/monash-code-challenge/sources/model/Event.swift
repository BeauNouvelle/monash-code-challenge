//
//  Event.swift
//  monash-code-challenge
//
//  Created by Beau Nouvelle on 18/1/20.
//  Copyright © 2020 beanunouvelle. All rights reserved.
//

import Foundation

struct Event: Decodable {
    let startTime: String
    let endTime: String
    let title: String
    let lecturer: String
    let location: String
}
