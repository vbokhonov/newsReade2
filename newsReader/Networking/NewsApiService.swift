//
//  NewsApiService.swift
//  newsReader
//
//  Created by Valentyn Bokhonov on 04.06.2021.
//

import Foundation

class NewsApiService {
    
    private let session = URLSession.shared
//    private let endpoint = "/v2/everything"
     private let endpoint = "/v2/top-headlines"
    private let sources = "abc-news,associated-press,bbc-news"
//    private let country = "gb"
    private let apiKey = "1c12d0d191fc4097952a7d35c7a69bc5"
    
    func getNews(completion: @escaping (([Article]) -> Void)) {
//        let request = URLRequest(url: URL(string: "https://newsapi.org/v2/everything?sources=abc-news,associated-press,bbc-news&apiKey=1c12d0d191fc4097952a7d35c7a69bc5")!)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = endpoint
        urlComponents.queryItems = [
            URLQueryItem(name: "sources", value: sources),
//            URLQueryItem(name: "country", value: country),
            URLQueryItem(name: "apiKey", value: apiKey)
        ]

        let request = URLRequest(url: URL(string: urlComponents.url!.absoluteString)!)
        
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
