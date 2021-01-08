//
//  Form781Controller.swift
//  PBLiOS
//
//  Created by John Bethancourt on 1/2/21.
//

import CoreData

public class Form781Controller: ObservableObject {
    
    @Published var isNewForm = false

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func createForm(item: Form781) {
        let newForm = Form781(context: self.context)
        newForm.mds = "asbe"
        try? self.context.save()
     }
}
