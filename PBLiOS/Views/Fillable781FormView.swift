//
//  Fillable781FormView.swift
//  PBLiOS
//


import Foundation
import SwiftUI

struct Fillable781FormView: View{
    
    @Environment(\.managedObjectContext) private var moc
    
    @State private var mds              = ""
    @State private var date             = Date()
    @State private var serialNumber     = ""
    @State private var unitCharged      = ""
    @State private var harmLocation     = ""
    @State private var flightAuthNum    = ""
    @State private var issuingUnit      = ""
    @State private var flights          = [Flight]()
    @State private var aircrewData      = [AircrewData]()
    @State private var remarks          = ""
    
    var form: Form781
    
    var body: some View {
        
        VStack{
            HStack{
                Text(" AFTO Form 781 For \(form.date!.defaultDisplayDate())")
                    .dmSansFontBold(style: .title2)
                    .padding(.leading)
                  
                Spacer()
                NavigationLink(destination:FormPreviewView(form:form)) {
                    Image(systemName: "doc.text")
                    Text("Preview")
                }
                .padding(.trailing)
                .disabled(mds.isEmpty || serialNumber.isEmpty || harmLocation.isEmpty)
                //why does the avove not work on the canvas preview?
                
            }
            
            Form {
                Section(header: Text("MISSION DATA").dmSansFont(style: .headline, weight: .bold)) {
                    
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                        .environment(\.locale, .init(identifier: "en_GB"))
                        .datePickerStyle(DefaultDatePickerStyle())
                    
                    TextField("MDS",            text: $mds)
                        .foregroundColor(mds.count < 4 ? .red : .primary)

                    TextField("Serial Number",  text: $serialNumber)
                    TextField("Unit Charged",   text: $unitCharged)
                    TextField("HARM Location",  text: $harmLocation)
                    TextField("Flight Authorization Number", text: $flightAuthNum)
                    TextField("Issuing Unit",   text: $issuingUnit)
                    // FOR IOS 14 ... TextEditor(text: $remarks)
                    TextField("Remarks",        text: $remarks)
                }
                Section(header: Text("Flights").dmSansFont(style: .headline, weight: .bold)){
                    HStack{
                        // Column headers
                        Text("Mission Number")
                            .frame(width: 75, height: 50, alignment: .center)
                        Text("Mission Symbol")
                            .frame(width: 75, height: 50, alignment: .center)
                        VStack{
                            Text("From")
                            Text("To")
                        }.frame(width: 60, height: 50, alignment: .center)
                        VStack{
                            Text("Take Off Time")
                            Text("Land Time (Z)")
                        }.frame(width: 222, height: 50, alignment: .center)
                        VStack{
                            Text("Landings")
                        }
                    }
                    ForEach(flights.indices, id:\.self ){ index in
                        FlightLineView(flights: $flights, index: index)
                    }
                    if flights.count <= 4{
                        Button(action: {
                            
                            let flight = Flight(context: moc)
                            flight.missionNumber = ""
                            flight.missionSymbol = ""
                            flight.fromICAO = ""
                            flight.toICAO = ""
                            flight.takeOffTime = Date()
                            flight.landTime = Date()
                            flight.form781 = form
                            withAnimation{
                                flights.append(flight)
                            }
                            
                            
                        }) {
                            Image(systemName: "plus.circle")
                        }
                    }
                    
                    
                }
                Section(header: Text("Crew").dmSansFont(style: .headline, weight: .bold)){
                    Text("Crew Stuff")
                }
            }
        }
        .onAppear{
            loadData()
        }
        .onDisappear{
            saveData()
        }
    }
    
    public func loadData(){
        self.mds            = self.form.mds ?? ""
        self.date           = self.form.date ?? Date()
        self.serialNumber   = self.form.serialNumber ?? ""
        self.unitCharged    = self.form.unitCharged ?? ""
        self.harmLocation   = self.form.harmLocation ?? ""
        self.flightAuthNum  = self.form.flightAuthNum ?? ""
        self.issuingUnit    = self.form.issuingUnit ?? ""
        self.flights        = self.form.flightsArray
        self.aircrewData    = self.form.aircrewDataArray
        self.remarks        = self.form.remarks ?? ""
    }
    
    public func saveData(){
        self.form.mds           = self.mds
        self.form.date          = self.date
        self.form.serialNumber  = self.serialNumber
        self.form.unitCharged   = self.unitCharged
        self.form.harmLocation  = self.harmLocation
        self.form.flightAuthNum = self.flightAuthNum
        self.form.issuingUnit   = self.issuingUnit
        self.form.remarks       = self.remarks
        try? self.moc.save()
    }
}

struct FlightLineView: View {
    @Binding var flights: [Flight]
    var index: Int
    
    var body: some View{
        HStack {
            TextField("#", text: Binding(
                get: { return flights[index].missionNumber! },
                set: { (newValue) in return self.flights[index].missionNumber = newValue}
            ))
            .frame(width: 75, height: 25, alignment: .center)
            
            TextField("symbol", text: Binding(
                get: { return flights[index].missionSymbol! },
                set: { (newValue) in return self.flights[index].missionSymbol = newValue}
            ))
            .frame(width: 75, height: 25, alignment: .center)
            
            VStack{
                TextField("from", text: Binding(
                    get: { return flights[index].fromICAO! },
                    set: { (newValue) in return self.flights[index].fromICAO = newValue}
                ))
                .frame(width: 60, height: 25, alignment: .center)
                
                TextField("to", text: Binding(
                    get: { return flights[index].toICAO! },
                    set: { (newValue) in return self.flights[index].toICAO = newValue}
                ))
            }
            .frame(width: 60, height: 25, alignment: .center)
            VStack{
                 DatePicker("", selection: Binding(
                    get: { return flights[index].takeOffTime! },
                    set: { (newValue) in return self.flights[index].takeOffTime = newValue}
                ), displayedComponents: [.date, .hourAndMinute])
                .environment(\.locale, .init(identifier: "en_GB"))
                .datePickerStyle(DefaultDatePickerStyle())
                .frame(width: 200, height: 25, alignment: .center)
                DatePicker("", selection: Binding(
                    get: { return flights[index].landTime! },
                    set: { (newValue) in return self.flights[index].landTime = newValue}
                ), displayedComponents: [.date, .hourAndMinute])
                .environment(\.locale, .init(identifier: "en_GB"))
                .datePickerStyle(DefaultDatePickerStyle())
                .frame(width: 200, height: 25, alignment: .center)
            }
            
            VStack{
                HStack{
                    Text("   T&G      ")
                     TextField("t&g", text: Binding(
                        get: { return String(flights[index].touchAndGo) },
                        set: { (newValue) in return self.flights[index].touchAndGo = Int16(newValue) ?? 0}
                    ))
                }
                HStack{
                    Text("  Full Stop")
                     TextField("FS", text: Binding(
                        get: { return String(flights[index].fullStop) },
                        set: { (newValue) in return self.flights[index].fullStop = Int16(newValue) ?? 0}
                    ))
                }
                
            }
     
        }.multilineTextAlignment(.center) //center text within TextFields
    }
}

struct Fillable781Preview_Previews: PreviewProvider {
    static var previews: some View {
        
        let _ = PersistenceController.shared
        
        let form: Form781 = {
            let form = Form781(context: PersistenceController.preview.container.viewContext)
            form.date = Date()
            form.mds = "C017A"
            form.serialNumber = "08-8195"
            form.harmLocation = "JB Charleston"
            form.unitCharged = "437 AW (HQ AMC)/DKFX"
            form.flightAuthNum = "20-0539"
            form.issuingUnit = "0016AS"
            
            
            let flight = Flight(context:  PersistenceController.preview.container.viewContext)
            flight.missionNumber = "123"
            flight.missionSymbol = "456"
            flight.fromICAO = "KTIK"
            flight.toICAO = "KTIK"
            flight.takeOffTime = Date()
            flight.landTime = Date()
            flight.form781 = form
            
            let flight2 = Flight(context:  PersistenceController.preview.container.viewContext)
            flight2.missionNumber = "654"
            flight2.missionSymbol = "432"
            flight2.fromICAO = "KTCM"
            flight2.toICAO = "KNGB"
            flight2.takeOffTime = Date()
            flight2.landTime = Date()
            flight2.form781 = form 
            
            return form
        }()
        
        Group {
            
            Fillable781FormView(form:form).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .padding()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
                .previewDisplayName("iPad Pro (9.7-inch)")
            
            Fillable781FormView(form:form).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .padding()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
                .previewDisplayName("iPad Pro (9.7-inch)")
                .previewLayout(.fixed(width: 2048 / 2, height: 1536 / 2))
            
     
            
             //            Fillable781FormView(form:form).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            //                .padding()
            //                .previewDevice(PreviewDevice(rawValue:Devices.iPhone12.rawValue))
            //                .previewDisplayName(Devices.iPhone12.rawValue)
        }
        
    }
}
