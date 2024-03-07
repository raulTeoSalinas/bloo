//
//  AppState.swift
//  Bloo
//
//  Created by Raul Salinas on 3/7/24.
//

import Foundation
import SwiftUI

class AppState: ObservableObject, Observable {
    @Published var isWashDisherViewActive = false
}
