//
//  UpdateStore.swift
//  SwiftUI Design Code Course
//
//  Created by Vatana Chhorn on 22/10/2020.
//

import SwiftUI
import Combine

class UpdateStore : ObservableObject {
    @Published var updates : [Update] = updateData
}
