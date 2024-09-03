//
//  MeetingApp.swift
//  Meeting
//
//  Created by Artem on 9/2/24.
//

import SwiftUI

@main
struct MeetingApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
