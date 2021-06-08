//
//  NewsApiService.swift
//  newsReader
//
//  Created by Valentyn Bokhonov on 04.06.2021.
//

import Foundation

struct Articles: Codable {
    let title: String
    let description: String
}

struct News: Codable {
    let articles: Articles
    let urlToImage: String
}

struct UrlConstructor {
    let domain: String = "https://newsapi.org/v2/sources?"
    let category: String // business entertainment general health science sports technology
    let language: String // en ru
    let country: String // us ua
    let apiKey: String = "apiKey=1c12d0d191fc4097952a7d35c7a69bc5"
}

class NewsApiService {
    
    private let session = URLSession.shared
    
    func getNews(completion: @escaping (([News]) -> Void)) {
        let url = UrlConstructor(category: "&", language: "&", country: "&")
        let request = URLRequest(url: URL(string: url.domain+url.category+url.language+url.country+url.apiKey)!)
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200,
               let data = data {
                
                print(String(data: data, encoding: .utf8))
                
                do {
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                    completion(newsResponse.results)
                } catch {
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
    }
    
}
