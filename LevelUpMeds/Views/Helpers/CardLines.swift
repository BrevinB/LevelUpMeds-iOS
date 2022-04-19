//
//  CardLines.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 2/17/22.
//

import SwiftUI

struct CardLines: View {
    @ObservedObject var calendarVM = CalendarViewModel()
    var body: some View {
        VStack(spacing: 10) {
            Circle()
                .fill(calendarVM.isCurrentHour(date: Date.now) ? .black : .clear)
                .frame(width: 15, height: 15)
                .background(
                
                    Circle()
                        .stroke(.black, lineWidth: 1)
                        .padding(-3)
                    
                )
                .scaleEffect(!calendarVM.isCurrentHour(date: Date.now) ? 0.8 : 1)
            
            Rectangle()
                .fill(.black)
                .frame(width: 8)
        }
    }
}

struct CardLines_Previews: PreviewProvider {
    static var previews: some View {
        CardLines()
    }
}
