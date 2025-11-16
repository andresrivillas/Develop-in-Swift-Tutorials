//
//  ChartView.swift
//  HikingSurvey
//
//  Created by Andres Rivillas on 15/11/25.
//

import SwiftUI
import Charts

struct ChartView: View {
    var responses: [Response]
    
    init(responses: [Response]) {
        self.responses = responses.sorted { $0.score < $1.score }
    }
    
    var body: some View {
        Chart(responses) { response in
            //                    SectorMark(angle: .value("Type", 1), innerRadius: .ratio(0.75))
            //                        .foregroundStyle(by: .value("sentiment", response.sentiment))
            BarMark(
                x: .value("Language", response.language),
                y: .value("Score", response.score)
            )
            .foregroundStyle(by: .value("sentiment", response.sentiment))
        }
        .chartForegroundStyleScale([
            Sentiment.positive : Sentiment.positive.sentimentColor,
            Sentiment.negative : Sentiment.negative.sentimentColor,
            Sentiment.moderate : Sentiment.moderate.sentimentColor,
            Sentiment.slightlyNegative : Sentiment.slightlyNegative.sentimentColor,
            Sentiment.slightlyPositive : Sentiment.slightlyPositive.sentimentColor
        ])
//        .chartBackground { chartProxy in
//            GeometryReader { geometry in
//                if let anchor = chartProxy.plotFrame {
//                    let frame = geometry[anchor]
//                    Image(systemName: "figure.hiking")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(height: frame.height * 0.4)
//                        .foregroundStyle(Color(white: 0.59))
//                        .position(x: frame.maxX, y: frame.midY)
//                }
//            }
//        }
        .chartLegend(position: .trailing, alignment: .bottom)
        .frame(height: 200)
        .padding()
    }
}


#Preview {
    ContentView()
}
