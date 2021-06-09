//
//  NewsApiService.swift
//  newsReader
//
//  Created by Valentyn Bokhonov on 04.06.2021.
//

import Foundation

class NewsApiService {
    
    private let session = URLSession.shared
    
    func getNews(completion: @escaping (([Article]) -> Void)) {
        let request = URLRequest(url: URL(string: "https://newsapi.org/v2/everything?sources=abc-news,associated-press,bbc-news&apiKey=1c12d0d191fc4097952a7d35c7a69bc5")!)
        
        //        var comp = URLComponents()
        //        comp.queryItems = [
        //            URLQueryItem(name: <#T##String#>, value: <#T##String?#>)
        //        ]
        //
        //        comp.url
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200,
               let data = data {
                
//                print(String(data: data, encoding: .utf8))
                
                do {
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                    completion(newsResponse.articles)
                } catch {
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
    }
    
}
