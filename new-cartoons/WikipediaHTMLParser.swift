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
let undeterminedValue = "TBA"
let tableClass = "wikitable"

private extension XMLElement {
    func isRowEmpty() -> Bool {
        return self.css("td").count == 0
    }
}

class WikipediaHTMLParser {
    private let html: String
    
    init(html: String) {
        self.html = html
    }
    
    private func getTextValue(of element: XMLElement) -> String {
        return element.innerHTML!.replacingOccurrences(of: "\n", with: "")
    }
    
    private func getCartoonTableHeaders() -> [String] {
        guard let doc = try? HTML(html: html, encoding: encoding) else { return [] }
        guard let table = doc.css(".\(tableClass)").first else { return [] }
        let ths = table.css("th")
        
        return ths.map(getTextValue(of:))
    }
    
    func getParsedWikipediaCartoons() -> [WikipediaCartoon]? {
        let tableHeaders = getCartoonTableHeaders()
        
        guard let doc = try? HTML(html: html, encoding: encoding) else { return nil }
        guard let tbody = doc.css(".\(tableClass) tbody").first else { return nil }
        let rows = tbody.css("tr").filter{ !$0.isRowEmpty() }.map { row -> [String] in
            let cells = row.css("td").map { cell -> String in
                if let i = cell.css("i").first {
                    if let a = i.css("a").first {
                        return getTextValue(of: a)
                    }
                    return getTextValue(of: i)
                } else if let a = cell.css("a").first {
                    return getTextValue(of: a)
                }
                return getTextValue(of: cell)
            }
            return cells
        }
        
        if let titleIndex = tableHeaders.firstIndex(of: "Title"), let countryIndex = tableHeaders.firstIndex(of: "Country"), let originalChannelIndex = tableHeaders.firstIndex(of: "Original channel"), let episodesIndex = tableHeaders.firstIndex(of: "Episodes"), let techniqueIndex = tableHeaders.firstIndex(of: "Technique") {
            return rows.map { row in
                let title = row[titleIndex]
                let country = row[countryIndex]
                let originalChannel = row[originalChannelIndex]
                let numberOfEpisodes = row[episodesIndex] == undeterminedValue ? nil : Int(row[episodesIndex])
                let technique = row[techniqueIndex] == undeterminedValue ? nil : row[techniqueIndex]
                
                return WikipediaCartoon(title: title, country: country, originalChannel: originalChannel, numberOfEpisodes: numberOfEpisodes, technique: technique)
            }
        }
        
        return nil
    }
}
