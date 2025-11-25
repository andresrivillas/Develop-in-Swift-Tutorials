//
//  Badge.swift
//  GratefulMoments
//
//  Created by Andres Rivillas on 24/11/25.
//

import Foundation
import SwiftData

@Model
class Badge {
    var details: BadgeDetails
    var moment: Moment?
    var timestamp: Date?
    
    init(details: BadgeDetails) {
        self.details = details
        self.moment = nil
        self.timestamp = nil
    }
}

#if DEBUG
extension Badge {
    static var sample: Badge {
        let badge = Badge(details: .firstEntry)
        badge.timestamp = .now
        return badge
    }
}
#endif
