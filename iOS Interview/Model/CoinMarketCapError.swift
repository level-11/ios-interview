//
//  APIError.swift
//  iOS Interview
//
//  Created by Jonathan Willis on 1/1/18.
//

import Foundation

enum CoinMarketCapError: Error {
    case unexpectedResponse
    case deserializationFailed
    case responseError(error: Error)
}

extension CoinMarketCapError: Equatable {
    static public func ==(lhs: CoinMarketCapError, rhs: CoinMarketCapError) -> Bool {
        switch (lhs, rhs) {
        case (.unexpectedResponse, .unexpectedResponse):
            return true
        case (.deserializationFailed, .deserializationFailed):
             return true
        case (.responseError(_), .responseError(_)):
            return true
        default:
            return false
        }
    }
}
