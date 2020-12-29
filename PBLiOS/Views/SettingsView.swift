//
//  SettingsView.swift
//  PBLiOS
//
//  Created by John Bethancourt on 12/29/20.
//

import SwiftUI

struct SettingsView: View {
    
    //@AppStorage("harmDefault") private var harmDefault = "" // requires iOS 14, but makes life easier.
    @AppStorage13(key: "defaultMDS",    defaultValue: "C017A")                private var defaultMDS
    @AppStorage13(key: "unitCharged",   defaultValue: "437 AW (HQ AMC)/DKFX") private var defaultUnitCharged
    @AppStorage13(key: "defaultHarm",   defaultValue: "JRB Charleston")       private var defaultHarm
    @AppStorage13(key: "issuingUnit",   defaultValue: "0016AS")               private var defaultIssuingUnit
   
    
    var body: some View {
        Form{
            HStack{
                Text("Default MDS")
                TextField("Default MDS" ,           text: $defaultMDS)
            }
            HStack{
                Text("Default Unit Charged   :")
                TextField("Default Takeoff ICAO" ,  text: $defaultUnitCharged)
            }
            HStack{
                Text("Default Harm Location :")
                TextField("Default Harm Location" , text: $defaultHarm)
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
        Group{
            SettingsView()
                .previewDevice(PreviewDevice(rawValue: Devices.iPhone12.rawValue))
                .previewDisplayName(Devices.iPhone12.rawValue)
        }
       
    }
}
