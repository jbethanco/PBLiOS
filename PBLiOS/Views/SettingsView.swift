//
//  SettingsView.swift
//  PBLiOS
//
//  Created by John Bethancourt on 12/29/20.
//

import SwiftUI

struct SettingsView: View {
    
    @YoDefaults(key: .defaultMDS,             defaultValue: "C017A")                private var defaultMDS
    @YoDefaults(key: .defaultUnitCharged,     defaultValue: "437 AW (HQ AMC)/DKFX") private var defaultUnitCharged
    @YoDefaults(key: .defaultHarm,            defaultValue: "JRB Charleston")       private var defaultHarm
    @YoDefaults(key: .defaultIssuingUnit,     defaultValue: "0016AS")               private var defaultIssuingUnit
   
    let labelWidth: CGFloat = 180
    let labelHeight: CGFloat = 25
    
    var body: some View {
        Form{
            HStack{
                Text("Default MDS")
                    .frame(width: labelWidth, height: labelHeight, alignment: .leading)
                Text(":")
                TextField("Default MDS" ,           text: $defaultMDS)
            }
            HStack{
                Text("Default Unit Charged")
                    .frame(width: labelWidth, height: labelHeight, alignment: .leading)
                Text(":")
                TextField("Default Takeoff ICAO" ,  text: $defaultUnitCharged)
            }
            HStack{
                Text("Default Harm Location")
                    .frame(width: labelWidth, height: labelHeight, alignment: .leading)
                Text(":")
                TextField("Default Harm Location" , text: $defaultHarm)
            }
            HStack{
                Text("Default Issuing Unit")
                    .frame(width: labelWidth, height: labelHeight, alignment: .leading)
                Text(":")
                TextField("Default Issuing Unit" , text: $defaultIssuingUnit)
            }
        }
        
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            SettingsView()
                .previewDevice(PreviewDevice(rawValue: Devices.iPadPro9_7.rawValue))
                .previewDisplayName(Devices.iPadPro9_7.rawValue)
        }
//        Group{
//            SettingsView()
//                .previewDevice(PreviewDevice(rawValue: Devices.iPhone12.rawValue))
//                .previewDisplayName(Devices.iPhone12.rawValue)
//        }
       
    }
}
