//
//  Schedule.swift
//  monash-code-challenge
//
//  Created by Beau Nouvelle on 18/1/20.
//  Copyright © 2020 beanunouvelle. All rights reserved.
//

import Foundation

struct Schedule: Decodable {
    let todaysEvents: [Event]?
    let parking: [Parking]?
    let publicTransport: [PublicTransport]?
}
