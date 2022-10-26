//
//  File.swift
//  
//
//  Created by 김민성 on 2022/10/17.
//

import Foundation
import SwiftUI

public struct GrassViewCell: View {
    let date: Date?
    let onTouch: (Date) -> ()
    public var body: some View {
        
        RoundedRectangle(
            cornerSize: CGSize(width: 5, height: 5), style: .continuous
        )
        .aspectRatio(1.0, contentMode: .fit)
        .foregroundColor(Color.secondary.opacity(0.3))
        .onTapGesture {
            onTouch(date ?? Date())
        }
    }
}


