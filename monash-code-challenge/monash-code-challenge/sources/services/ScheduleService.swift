//
//  ScheduleService.swift
//  monash-code-challenge
//
//  Created by Beau Nouvelle on 18/1/20.
//  Copyright © 2020 beanunouvelle. All rights reserved.
//

import Foundation

struct ScheduleService {

    typealias ScheduleResult = (Result<Schedule, HTTPError>) -> Void
    private static let apiPath = "https://api.myjson.com/bins/11a6y2"

    static func schedule(completion: @escaping ScheduleResult) {

        guard let url = URL(string: ScheduleService.apiPath) else {
            completion(.failure(.invalidURL))
            return
        }

        let request = URLRequest(url: url)
        HTTPService.perform(request, decode: Schedule.self, result: completion)
    }

}
