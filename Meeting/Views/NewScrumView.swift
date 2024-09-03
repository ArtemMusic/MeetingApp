//
//  NewScrumView.swift
//  Meeting
//
//  Created by Artem on 9/3/24.
//

import SwiftUI

struct NewScrumView: View {
    @State var newScrum: DailyScrum = DailyScrum.emptyScrum
    @Binding var isPresentingNewView: Bool
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
        }
        .navigationTitle("New scrum")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Dismiss") {
                    isPresentingNewView = false
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    isPresentingNewView = false
                    scrums.append(newScrum)
                }
            }
        }
    }
}

#Preview {
    NewScrumView(isPresentingNewView: .constant(true), scrums: .constant(DailyScrum.sampleData))
}
