//
//  PublicTransport.swift
//  monash-code-challenge
//
//  Created by Beau Nouvelle on 18/1/20.
//  Copyright © 2020 beanunouvelle. All rights reserved.
//

import Foundation

struct PublicTransport: Decodable {
    let startLocation: String
    let endLocation: String
    // Should be a date so that we can update the UI as the time changes.
    // Since our data is static for this challenge, and I don't know when it will be reviewed, this isn't feasible.
    let timeUntilDeparture: String
}
