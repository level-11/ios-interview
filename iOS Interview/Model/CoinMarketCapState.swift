//
//  CoinMarketCapState.swift
//  iOS Interview
//
//  Created by Jonathan Willis on 12/28/17.
//

import Foundation

enum CoinMarketCapState {
    case loading
    case success([Ticker])
    case failure(CoinMarketCapError)
}

extension CoinMarketCapState: Equatable {
    static public func ==(lhs: CoinMarketCapState, rhs: CoinMarketCapState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case let (.success(a), .success(b)):
            return a == b
        case let (.failure(a), .failure(b)):
            return a == b
        default:
            return false
        }
    }
}

protocol CoinMarketCapDelegate: class {
    var state: CoinMarketCapState { get set }
}

protocol CoinMarketCapHandler: class {

    var delegate: CoinMarketCapDelegate? { get set }
    func fetchTicker()
}
