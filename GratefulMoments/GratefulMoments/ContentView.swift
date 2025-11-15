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
        VStack {
            Button("Create a Grateful Moment") {
                isPresented = true
            }
            .buttonStyle(.bordered)
            .sheet(isPresented: $isPresented){
                MomentEntryView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
