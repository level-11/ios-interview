//
//  Ticker+Get.swift
//  iOS Interview
//
//  Created by Jonathan Willis on 12/28/17.
//

import Foundation

extension Ticker {
    static func get(
        with environment: APIEnvironment,
        completionHandler: @escaping ((CoinMarketCapState) -> Void)) -> URLSessionDataTask {
        let task = environment
            .urlSession
            .dataTask(with: environment.getTicker) { data, _, error in

                guard error == nil else {
                    completionHandler(.failure(CoinMarketCapError.responseError(error: error!)))
                    return
                }

                guard let data = data else {
                    completionHandler(.failure(CoinMarketCapError.unexpectedResponse))
                    return
                }

                do {
                    let ticker = try environment.decoder.decode([Ticker].self, from: data)
                    completionHandler(.success(ticker))
                } catch(let error) {
                    print(error)
                    let apiError = CoinMarketCapError.deserializationFailed
                    completionHandler(.failure(apiError))
                }
        }
        task.resume()
        return task
    }
}
