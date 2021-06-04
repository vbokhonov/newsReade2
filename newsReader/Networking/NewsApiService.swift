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

class NewsApiService {
    
    private let session = URLSession.shared
    
    func getNews(completion: @escaping (([News]) -> Void)) {
        let request = URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=apple&pageSize=2&apiKey=1c12d0d191fc4097952a7d35c7a69bc5")!)
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200,
               let data = data {
                print(String(data: data, encoding: .utf8))
//
                do {
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                    completion(newsResponse.results)
                    print("There is no error")
                } catch {
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
    }
    
}
