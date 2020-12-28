//
//  TestView.swift
//  PBLiOS
//
//  Created by John Bethancourt on 12/24/20.
//

import SwiftUI
import CoreData

struct TestView: View {
    
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Form781.date, ascending: true)],
        animation: .default)
    
    private var forms: FetchedResults<Form781>
    
    var body: some View {
        
        VStack{
            Text("Forms : \(forms.count)")
        }
    }
}


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        
    }
}
