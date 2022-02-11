//
//  WikipediaHTMLParser.swift
//  new-cartoons
//
//  Created by Helder on 02/11/2022.
//

import Foundation
import Kanna
import UIKit

let encoding = String.Encoding.utf8

class WikipediaHTMLParser {
    private let html: String
    
    init(html: String) {
        self.html = html
    }
    
    func getParsedWikipediaCartoons() -> WikipediaCartoon {
        if let doc = try? HTML(html: html, encoding: encoding) {
            if let tbody = doc.css("tbody").first {
                let cells = tbody.css("td")
            }
        }
        return WikipediaCartoon()
    }
}
