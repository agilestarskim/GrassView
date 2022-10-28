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
    let color: Color
    let inputLevel: Int
    @Binding var location: CGPoint
    let onTouch: (String) -> ()
    
    @State var rect: CGRect = CGRect()
    @State private var scale = 1.0
    @State private var hover = false
    @State private var feedback = UISelectionFeedbackGenerator()
    public var body: some View {
        GeometryReader{ geo in
            RoundedRectangle(
                cornerSize: CGSize(width:  geo.size.width / 5, height: geo.size.height / 5), style: .continuous
            )
            .fill(inputLevel == 0 ?
                  Color.secondary.opacity(0.2) :
                      color.opacity(Double(inputLevel) / 10.0))
            .overlay(
                RoundedRectangle(
                    cornerSize: CGSize(width:  geo.size.width / 5, height: geo.size.height / 5), style: .continuous
                )
                .strokeBorder(Color.primary.opacity(0.5), lineWidth: hover ? 1 : 0)
            )
            
            .onAppear{
                rect = geo.frame(in: .named("container"))
            }
        }
        .aspectRatio(1.0, contentMode: .fit)
        .scaleEffect(scale)
        .animation(.default, value: scale)
        .onChange(of: location){ _ in
            feedback.prepare()
            if rect.contains(location){
                onTouch(date)
                scale = 1.4
                hover = true
            }else{
                hover  = false
                scale = 1.0
            }
        }
        .onChange(of: hover){ hover in
            if hover {
                feedback.selectionChanged()
            }
        }
        
    }
    
    
    
}
