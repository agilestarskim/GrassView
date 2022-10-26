//
//  File.swift
//  
//
//  Created by 김민성 on 2022/10/17.
//

import Foundation
import SwiftUI

public struct GrassViewCell: View {
    let date: String
    let inputLevel: Int
    let onTouch: (String) -> ()
    public var body: some View {
        
        RoundedRectangle(
            cornerSize: CGSize(width: 5, height: 5), style: .continuous
        )
        .aspectRatio(1.0, contentMode: .fit)
        .foregroundColor(
            inputLevel == 0 ?
            Color.secondary.opacity(0.2) :
                Color.green.opacity(Double(inputLevel) / 10.0)
        
        )
        .onTapGesture {
            onTouch(date)
        }
    }
}


//0~10
//0: secondary
//1~10: Green.opacity()