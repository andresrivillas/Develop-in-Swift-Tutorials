//
//  ContentView.swift
//  GratefulMoments
//
//  Created by Andres Rivillas on 15/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        TabView {
            Tab("Moments", image: "MomentsTab") {
                MomentsView()
            }
            Tab("Achievements", systemImage: "medal.fill"){
                AchievementsView()
            }
        }
    }
}

#Preview {
    ContentView()
        .sampleDataContainer()
}

#Preview("Dark") {
    ContentView()
        .sampleDataContainer()
        .preferredColorScheme(.dark)
}
