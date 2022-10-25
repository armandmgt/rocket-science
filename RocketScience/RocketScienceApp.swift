//
//  RocketScienceApp.swift
//  RocketScience
//
//  Created by Armand Mégrot on 25/10/2022.
//

import SwiftUI

@main
struct RocketScienceApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  @StateObject var authViewModel = AuthenticationViewModel()

  var body: some Scene {
    WindowGroup {
      ContentView().environmentObject(authViewModel)
    }
  }
}


enum AppEnvironment: String {
  case local
  case release

  static var current: AppEnvironment {
#if LOCAL
    return .local
#else
    return .release
#endif
  }
}
