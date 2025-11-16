//
//  Sentiment.swift
//  HikingSurvey
//
//  Created by Andres Rivillas on 15/11/25.
//

import Foundation
import SwiftUI
import Charts

enum Sentiment: String, Plottable {
    case positive = "Positive"
    case negative = "Negative"
    case moderate = "Moderate"
    case slightlyPositive = "Slightly Positive"
    case slightlyNegative = "Slightly Negative"
    
    init (_ score: Double) {
        if score > 0.5 {
            self = .positive
        } else if score > 0.2 {
            self = .slightlyPositive
        } else if score < -0.5 {
            self = .negative
        } else if score < -0.2  {
            self = .slightlyNegative
        } else {
            self = .moderate
        }
    }
    
    var icon: String {
        switch self {
        case .positive:
            return "chevron.up.2"
        case .slightlyNegative:
            return "chevron.down"
        case .slightlyPositive:
            return "chevron.up"
        case .negative:
            return "chevron.down.2"
        case .moderate:
            return "minus"
        }
    }
    
    var sentimentColor: Color {
        switch self {
        case .positive:
            return Color.green
        case .slightlyPositive:
            return Color(red: 0.99, green: 0.49, blue: 0.00)
        case .negative:
            return Color.red
        case .slightlyNegative:
            return Color(red: 0.08, green: 0.22, blue: 0.41)
        case .moderate:
            return Color(red: 0.00, green: 0.44, blue: 0.49)
        }
    }
}
