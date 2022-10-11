//
//  ExchangeManager.swift
//  Valute
//
//  Created by Uros Andonov on 7.10.22..
//

import Foundation

final class ExchangeManager {
    static let shared = ExchangeManager()
    private init() {
        
    }
    private var ratesPerUSD: [String: Double] = [:]
    private var lastUpdated: Date?
    private var isDownloading: Bool = false
    
    func rate(targetCC: String, sourceCC: String, callback: (Double?, ExchangeError?) -> Void) {
      guard
        let sourcePerUSD = ratesPerUSD[sourceCC],
        let targetPerUSD = ratesPerUSD[targetCC]
        else{
          
          if isDownloading{
              callback(nil, ExchangeError.fetchingRates)
              return
          }
          if lastUpdated == nil {
              fetchCurrencyRates()
              callback(nil, ExchangeError.fetchingRates)
          }
          
          callback(nil, .missingRates)
          
          return
      }
        let r = sourcePerUSD / targetPerUSD
        callback(r, nil)
    }
    
    func fetchCurrencyRates() {
        
        if isDownloading { return }
        guard
            let url = URL(string: "a")
        else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            [unowned self] (data,response,error) in
            
            self.isDownloading = true
            if let error = error {
                print(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }
            
            if !(200..<300).contains(httpResponse.statusCode) {
                return
            }
            
            guard let data = data else {
                return
            }

            
            self.ratesPerUSD = [:]
            lastUpdated = Date()
        }
        self.isDownloading = true
        task.resume()
    }
    
}
