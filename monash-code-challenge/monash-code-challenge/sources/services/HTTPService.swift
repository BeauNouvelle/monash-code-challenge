//
//  HTTPService.swift
//  monash-code-challenge
//
//  Created by Beau Nouvelle on 18/1/20.
//  Copyright © 2020 beanunouvelle. All rights reserved.
//

import Foundation

/// A generic wrapper around URLSession for performing requests.
struct HTTPService {
    /// A generic wrapper around URLSession for performing network requests.
    /// Handles error handling and decoding of any objects conforming to the Decodable protocol.
    ///
    /// - Parameters:
    ///   - request: The url request you wish to make.
    ///   - decode: Pass in the type of object you wish to have decoded from the get response.
    ///   - result: Returns either a decoded object, or HTTPError.
    static func perform<T: Decodable>(_ request: URLRequest, decode: T.Type, result: @escaping (Result<T, HTTPError>) -> Void) {

        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                if error.isConnectivityError {
                    result(.failure(.connectivityError))
                    return
                }
                result(.failure(.unknown(message: error.localizedDescription)))
                return
            }

            guard let response = response as? HTTPURLResponse, let data = data else {
                result(.failure(.noResponse))
                return
            }

            guard statusCodeIsValid(for: response) else {
                result(.failure(.unsuccessfulStatusCode(response.statusCode)))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                result(.success(decodedData))
            } catch let error {
                print(error)
                result(.failure(.decodeFailed(message: error.localizedDescription)))
            }
            return
        }

        task.resume()
        session.finishTasksAndInvalidate()
    }

    private static var successCodes: Range<Int> = 200..<299

    /// Checks if the status code for the provided response is within the `successCodes` range.
    private static func statusCodeIsValid(for httpResponse: HTTPURLResponse) -> Bool {
        guard successCodes.contains(httpResponse.statusCode) else {
            return false
        }
        return true
    }

}
