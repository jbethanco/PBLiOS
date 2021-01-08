//
//  ContentView.swift
//  PBLiOS
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Form781.date, ascending: true)],
        animation: .default)
    
    private var forms: FetchedResults<Form781>
    
    @State private var showSettings = false
    
    var body: some View {
        TabView {
            VStack{
                Text("MAIN MENU").padding()
                Text("Get Help").padding()
                Text("Do the things").padding()
            }
       
            .tabItem {
                                Image(systemName: "list.dash")
                                
                            }
        NavigationView {
            VStack {
                List {
                    ForEach(forms) { form in
                        NavigationLink(destination:Fillable781FormView(form:form)) {
                            
                            Text(form.date!.defaultDisplayDate())
                                .dmSansFont(style: .headline, weight: .medium)
                                .padding(.init(top: 4, leading: 20, bottom: 4, trailing: 20))
                                .background(Color.gray)
                                .cornerRadius(5)
                                .foregroundColor(Color(.white))
                        }
                    }
                    .onDelete(perform: deleteItems)
                } // End List
                // .navigationTitle("Forms") //iOS 14 only :(
                .dmSansFontBold(style: .headline, weight: .bold)
                .navigationBarItems(leading: EditButton(),
                                    trailing:
                                        Button(action: { addItem() }) { Image(systemName: "plus.circle") }
                ) // nav bar items
                // Settings sheet view overlay
                .sheet(isPresented: $showSettings, content: { SettingsView() })
                
                HStack{
                    //Button to show the settings
                    Button(action: { showSettings.toggle() }) { Image(systemName: "gear") }
                    .padding()
                    Spacer()
                }// End HStack
                
            }// End VStack
            
        } // End NavigationView
        .tabItem {
                            Image(systemName: "square.and.pencil")
                            Text("Edit Forms")
                        }
        //sets a default font for most cases
        .environment(\.font, Font.custom("DMSans-Medium", size: 16))
          
        }
    }
    
    private func addItem() {
   
        withAnimation {
            let newForm = Form781(context: moc)
            newForm.date = Date()
            newForm.mds = DefaultsManager.stringFor(key: .defaultMDS)
            newForm.issuingUnit = DefaultsManager.stringFor(key: .defaultIssuingUnit)
            newForm.harmLocation = DefaultsManager.stringFor(key: .defaultHarm)
            newForm.unitCharged = DefaultsManager.stringFor(key: .defaultUnitCharged)
           
            do {
                try moc.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { forms[$0] }.forEach(moc.delete)
            
            do {
                try moc.save()
            } catch {
                
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                 
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                 
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       //With iOS < 14... need the following line
        //Without it... the PersistenceController doesn't get initialized. Yet it does with iOS 14's App File ... Only effects previews
        let _ = PersistenceController.preview
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .previewDevice(PreviewDevice(rawValue: Devices.iPadPro9_7.rawValue))
            .previewDisplayName(Devices.iPadPro9_7.rawValue)
    }
}
