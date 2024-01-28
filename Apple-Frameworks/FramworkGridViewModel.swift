//
//  FramworkGrdiViewModel.swift
//  Apple-Frameworks
//
//  Created by Dongtaes on 27.01.2024.
//

import Foundation
import SwiftUI

final class FramworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework?{
        didSet{
            isShowingDetailView = true
        }
    }
    @Published var isShowingDetailView = false
}
