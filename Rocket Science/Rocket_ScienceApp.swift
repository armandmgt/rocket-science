//
//  Rocket_ScienceApp.swift
//  Rocket Science
//
//  Created by Armand Mégrot on 21/10/2022.
//

import SwiftUI

@main
struct Rocket_ScienceApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  @StateObject var viewModel = AuthenticationViewModel()

  var body: some Scene {
    WindowGroup {
      ContentView().environmentObject(viewModel)
    }
  }
}
