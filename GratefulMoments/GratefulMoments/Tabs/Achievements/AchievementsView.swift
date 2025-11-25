//
//  AchievementsView.swift
//  GratefulMoments
//
//  Created by Andres Rivillas on 24/11/25.
//

import SwiftUI
import SwiftData

struct AchievementsView: View {
    @Query(filter: #Predicate<Badge> { $0.timestamp != nil })
    private var unlockedBadges: [Badge]
    
    @Query(filter: #Predicate<Badge> { $0.timestamp == nil })
    private var lockedBadges: [Badge]
    
    @Query(sort: \Moment.timestamp)
    private var moments: [Moment]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                contentStack
            }
            .navigationTitle("Achievements")
        }
    }
    
    private var contentStack: some View {
        VStack(alignment: .leading) {
            StreakView(numberOfDays: StreakCalculator().calculateStreak(for: moments))
                .frame(maxWidth: .infinity)
            if !unlockedBadges.isEmpty {
                header("Your Badges")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(sortedUnLockedBadges) { badge in
                            UnlockedBadgeDetailView(badge: badge)
                        }
                    }
                }
                .scrollClipDisabled()
                .scrollIndicators(.hidden)
            }
            if !lockedBadges.isEmpty {
                header("Locked Badges")
                ForEach(lockedBadges) { badge in
                    LockedBadgeView(badge: badge)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
    
    func header(_ text: String) -> some View {
        Text(text)
            .font(.subheadline.bold())
            .padding()
    }
    
    private var sortedUnLockedBadges: [Badge] {
        unlockedBadges.sorted {
            ($0.timestamp!, $0.details.title) < ($1.timestamp!, $1.details.title)
        }
    }
    
    private var sortedLockedBadges: [Badge] {
        lockedBadges.sorted {
            $0.details.rawValue < $1.details.rawValue
        }
    }
}

#Preview {
    AchievementsView()
        .sampleDataContainer()
}
