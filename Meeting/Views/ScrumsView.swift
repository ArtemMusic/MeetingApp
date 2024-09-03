//
//  ScrumsView.swift
//  Meeting
//
//  Created by Artem on 9/2/24.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewView: Bool = false
    
    var body: some View {
        NavigationStack{
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily scrums")
        
            .toolbar{
                Button(action: {
                    isPresentingNewView = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $isPresentingNewView, content: {
                NavigationStack {
                    NewScrumView(isPresentingNewView: $isPresentingNewView, scrums: $scrums)
                }
            })
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}
