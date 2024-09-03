//
//  DetailEditView.swift
//  Meeting
//
//  Created by Artem on 9/2/24.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendeeName: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesDouble, in: 5...60, step: 1)
                    Spacer()
                    Text("\(scrum.lengthInMinutes) min")
                }
                ThemePicker(selection: $scrum.theme)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete(perform: { indexSet in
                    scrum.attendees.remove(atOffsets: indexSet)
                })
                HStack {
                    TextField("New attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let newAttendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(newAttendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
