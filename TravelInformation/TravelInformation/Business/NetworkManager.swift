//
//  NetworkManager.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 15/10/20.
//

import UIKit

class NetworkManager {
    
    /// Avoid external instantiation
    private init() {}
    
    //MARK: Singleton
    static let shared = NetworkManager()
    
    //MARK: Fetch Countries
    func fetchCountries(completionHandler: @escaping ([Country]) -> Void) {
      let url = URL(string: "http://ec2-3-16-29-21.us-east-2.compute.amazonaws.com:3100/all")!

      let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        if let error = error {
          print("Error with fetching countries: \(error)")
          return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
                //TODO: Change this to show alert
            print("Error with the response, unexpected status code: \(String(describing: response))")
          return
        }

        if let data = data,
          let countrySummary = try? JSONDecoder().decode([Country].self, from: data) {
          completionHandler(countrySummary ?? [])
        }
      })
      task.resume()
    }
    
    
    
}
