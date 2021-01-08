//
//  FlightCardView.swift
//  PBLiOS
//
//  Created by John Bethancourt on 12/30/20.
//

import SwiftUI

struct FlightCardView: View {
    
    var flight: Flight
    @State var toICAO  = ""
    @State var fromICAO = ""
    @State var missionNumber = "123"
    @State var missionSymbol = "Prince"
    @State var takeOffTime = Date()
    @State var landTime = Date()
     
    var body: some View{
        HStack {
            VStack{
                HStack{
                    Text("Mission Number: ")
                        .frame(width: 144, height: 10, alignment: .center)
                    TextField("#", text: $missionNumber)
                        .frame(width: 90, height: 30, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("From:")
                        .frame(width: 44, height: 10, alignment: .center)
                    TextField("from", text: $fromICAO)
                        .frame(width: 65, height: 30, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    DatePicker("", selection:  $takeOffTime, displayedComponents: [.date ,.hourAndMinute])
                   .environment(\.locale, .init(identifier: "en_GB"))
                    .frame(width: 200, height: 24, alignment: .center)
                    
                }.multilineTextAlignment(.center)
                
                HStack{
                    Text("Mission Symbol:")
                        .frame(width: 144, height: 10, alignment: .center)
                    TextField("symbol", text: $missionSymbol)
                        .frame(width: 90, height: 30, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("To:")
                        .frame(width: 44, height: 10, alignment: .center)
                    TextField("to", text: $toICAO)
                        .frame(width: 65, height: 30, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    DatePicker("", selection: $landTime, displayedComponents: [ .date, .hourAndMinute])
                   .environment(\.locale, .init(identifier: "en_GB"))
                   .frame(width: 200, height: 24, alignment: .center)
                        
                }
                
                
            }
            
//            Button(action: {
//
//               print("Do the things")
//
//            }) {
//                Text("Landings & Sorties")
//                    .font(.callout)
//            }
//            .frame(width: 60, height: 76, alignment: .center)
//            .background(Color(.sRGB, red: 0.5, green: 0.5, blue: 0.5, opacity: 0.07))
//            .overlay(
//                RoundedRectangle(cornerRadius: 4)
//                    .stroke(Color(.sRGB, red: 0.5, green: 0.5, blue: 0.5, opacity: 0.07), lineWidth: 1)
//            )
        }
        .padding()
        .background(Color.white.opacity(1.0))
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
        .multilineTextAlignment(.center)
        
        .onAppear{
            load()
        }.onDisappear(){
            save()
        }
        
    }
    func load(){
        self.fromICAO = flight.fromICAO ?? ""
        self.toICAO = flight.toICAO ?? ""
    }
    func save(){
        flight.toICAO = self.toICAO
        flight.fromICAO = self.fromICAO
    }
}
