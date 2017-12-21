//
//  APIEnvironment.swift
//  iOS Interview
//
//  Created by Jonathan Willis on 1/1/18.
//

import Foundation

protocol APIEnvironment {
    var urlSession: URLSession { get }
    var decoder: JSONDecoder { get }
    var baseURL: URL { get }
    var getTicker: URLRequest { get }
}

class ProductionAPIEnvironment: APIEnvironment {

    lazy var urlSession = URLSession.shared

    lazy var decoder = JSONDecoder()

    lazy var baseURL = URL(string: "https://api.coinmarketcap.com/v1")!

    lazy var getTicker = URLRequest(url: baseURL.appendingPathComponent("ticker",
                                                                        isDirectory: true))
}
