//
//  Scorer.swift
//  HikingSurvey
//
//  Created by Andres Rivillas on 15/11/25.
//

import Foundation
import NaturalLanguage

class Scorer {
    let tagger = NLTagger(tagSchemes: [.sentimentScore])
    
    func score(_ text: String)  -> Double {
        var sentimentScore = 0.0
        tagger.string = text
        tagger.enumerateTags(
            in: text.startIndex..<text.endIndex,
            unit: .paragraph,
            scheme: .sentimentScore,
            options: []) { sentimentTag, _ in
                if let sentimentString = sentimentTag?.rawValue, let score = Double(sentimentString) {
                    sentimentScore = score
                    return true
                }
                
                return false
            }
        return sentimentScore
    }
}

class LanguageTrack {
    let tagger = NLTagger(tagSchemes: [.language])
    
    func track(_ text: String) -> String {
        var languageRecon: String = "en"
        tagger.string = text
        tagger.enumerateTags(
            in: text.startIndex..<text.endIndex,
            unit: .paragraph,
            scheme: .language,
            options: []) { tag, _ in
                if let language = tag?.rawValue {
                    languageRecon = language
                    return true
                }
                
                return false
            }
        return languageRecon
    }
}
