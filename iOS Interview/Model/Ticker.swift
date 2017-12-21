//
//  Ticker.swift
//  iOS Interview
//
//  Created by Jonathan Willis on 12/28/17.
//

import Foundation

// documentation: https://coinmarketcap.com/api/
struct Ticker: Codable {
    let id: String
    let name: String
    let symbol: String
    let rank: Int
    let priceUSD: Float
    let priceBTC: Float
    let dayVolumeUSD: Float
    let marketCapUSD: Float
    let availableSupply: Float
    let totalSupply: Float
    let percentChange1h: Float
    let percentChange24h: Float
    let percentChange7d: Float
    let lastUpdated: TimeInterval

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case rank
        case priceUSD = "price_usd"
        case priceBTC = "price_btc"
        case dayVolumeUSD = "24h_volume_usd"
        case marketCapUSD = "market_cap_usd"
        case availableSupply = "available_supply"
        case totalSupply = "total_supply"
        case percentChange1h = "percent_change_1h"
        case percentChange24h = "percent_change_24h"
        case percentChange7d = "percent_change_7d"
        case lastUpdated = "last_updated"
    }
}

extension Ticker: Equatable {
    static public func ==(lhs: Ticker, rhs: Ticker) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.symbol == rhs.symbol &&
            lhs.rank == rhs.rank &&
            lhs.priceUSD == rhs.priceUSD &&
            lhs.priceBTC == rhs.priceBTC &&
            lhs.dayVolumeUSD == rhs.dayVolumeUSD &&
            lhs.marketCapUSD == rhs.marketCapUSD &&
            lhs.availableSupply == rhs.availableSupply &&
            lhs.totalSupply == rhs.totalSupply &&
            lhs.percentChange1h == rhs.percentChange1h &&
            lhs.percentChange24h == rhs.percentChange24h &&
            lhs.percentChange7d == rhs.percentChange7d &&
            lhs.lastUpdated == rhs.lastUpdated
    }
}


// API incorrectly returns numbers as strings
public extension KeyedDecodingContainer {

    public func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
        let stringValue = try self.decode(String.self, forKey: key)
        guard let floatValue = Float(stringValue) else {
            let context = DecodingError.Context(codingPath: codingPath,
                                                debugDescription: "Could not parse json key to a Float object")
            throw DecodingError.dataCorrupted(context)
        }
        return floatValue
    }

    public func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
        let stringValue = try self.decode(String.self, forKey: key)
        guard let floatValue = Double(stringValue) else {
            let context = DecodingError.Context(codingPath: codingPath,
                                                debugDescription: "Could not parse json key to a Double object")
            throw DecodingError.dataCorrupted(context)
        }
        return floatValue
    }

    public func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
        let stringValue = try self.decode(String.self, forKey: key)
        guard let floatValue = Int(stringValue) else {
            let context = DecodingError.Context(codingPath: codingPath,
                                                debugDescription: "Could not parse json key to a Int object")
            throw DecodingError.dataCorrupted(context)
        }
        return floatValue
    }
}
