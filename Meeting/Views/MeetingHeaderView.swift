//
//  MeetingHeaderView.swift
//  Meeting
//
//  Created by Artem on 9/2/24.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                    HStack {
                        Text("\(secondsRemaining)") // Текст слева
                        Image(systemName: "hourglass.bottomhalf.fill") // Иконка справа
                    }
                }
            }
        }
        .padding([.top, .horizontal])
    }
}

#Preview {
    MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 10)
}
