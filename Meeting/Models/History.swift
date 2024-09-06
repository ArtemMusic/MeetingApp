//
//  History.swift
//  Meeting
//
//  Created by Artem on 9/5/24.
//

import Foundation

struct History: Identifiable, Codable {
    var id: UUID
    var date: Date
    var attendees: [DailyScrum.Attendee]
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
