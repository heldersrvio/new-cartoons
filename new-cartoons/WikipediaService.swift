//
//  WikipediaService.swift
//  new-cartoons
//
//  Created by Helder on 02/11/2022.
//

import Foundation

class WikipediaService {
    private let mainUrl = "https://en.wikipedia.org/w/api.php"
    private let animatedSeriesPath = "List_of_animated_television_series_of_"
    private let formatVersion = "2"
    private let format = "json"
    
    private func getPage(for year: Int) -> String {
        return animatedSeriesPath + String(year)
    }
    
    private func getPageUrl(for year: Int) -> URL? {
        let queryItems = [
            URLQueryItem(name: "action", value: "parse"),
            URLQueryItem(name: "prop", value: "text"),
            URLQueryItem(name: "formatversion", value: formatVersion),
            URLQueryItem(name: "format", value: format),
            URLQueryItem(name: "page", value: getPage(for: year))
        ]
        var urlComponents = URLComponents(string: mainUrl)
        urlComponents?.queryItems = queryItems
        
        return urlComponents?.url
    }
    
    private func makeRequest(for url: URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                guard let parse = json["parse"] as? [String: Any], let text = parse["text"] as? String else { return }
                let parser = WikipediaHTMLParser(html: text)
                print(parser.getParsedWikipediaCartoons()!)
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func getAnimatedSeriesList(for year: Int) {
        if let url = getPageUrl(for: year) {
            makeRequest(for: url)
        }
    }
}
