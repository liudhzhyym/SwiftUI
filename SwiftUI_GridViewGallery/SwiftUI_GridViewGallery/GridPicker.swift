//
//  GridPicker.swift
//  SwiftUI_GridViewGallery
//
//  Created by bakhaan on 2021/02/04.
//

import Foundation
import SwiftUI


struct GridTypePicker: View {
    
    @Binding var selectedGridType: GridType
    
    var body: some View {
        Picker("Grid Type", selection: $selectedGridType) {
            ForEach(GridType.allCases, id: \.self) { type in
                switch type {
                case .single:
                    Image(systemName: "rectangle.grid.1x2")
                case .double:
                    Image(systemName: "square.grid.2x2")
                case .triple:
                    Image(systemName: "square.grid.3x2")
                case .adaptive:
                    Image(systemName: "square.grid.4x3.fill")
                }
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
