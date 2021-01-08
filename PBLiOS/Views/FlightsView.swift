//
//  FlightsView.swift
//  PBLiOS
//
//  Created by John Bethancourt on 12/31/20.
//

import SwiftUI

struct FlightsView: View {
    
    @State var flights : [Flight]!
    
    var body: some View{
         
            List{
                ForEach (flights, id: \.self) { flight in
                    FlightCardView(flight: flight)
                        .padding()
                }.onDelete(perform: deleteFlight)
                .onMove(perform: moveFlight)
            }
            .navigationBarItems(leading: EditButton())
    }
    func deleteFlight(at offsets: IndexSet) {
        flights.remove(atOffsets: offsets)
    }
    func moveFlight(from source: IndexSet, to destination: Int){
        flights.move(fromOffsets: source, toOffset: destination)
    }
}
