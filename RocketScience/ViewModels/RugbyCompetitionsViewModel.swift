//
//  RugbyCompetitionsViewModel.swift
//  Rocket Science
//
//  Created by Armand Mégrot on 21/10/2022.
//

import Foundation
import FirebaseDatabase
import FirebaseFunctions

struct Competition: Identifiable {
  let id = UUID()
  var name: String
}

class RugbyCompetitionsViewModel: ObservableObject {
  @Published var competitions: [Competition] = []

  func subscribe() {
    let funcs = Functions.functions()
    funcs.httpsCallable("subscribe").call() { result, error in

    }
//    DatabaseService.getDatabaseRef().child("competitions").observe(DataEventType.value, with: { snapshot in
//      if snapshot.exists(), let value = snapshot.value as? [String] {
//        self.competitions = value.map { Competition(name: $0) }
//      }
//    })
  }
}
