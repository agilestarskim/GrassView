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
    let workLevel: Int
    @ObservedObject var viewModel: GrassView.GrassViewModel
    
    @State var rect: CGRect = CGRect()
    @State private var scale = 1.0
    @State private var hover = false
    
    public var body: some View {
        GeometryReader{ geo in
            RoundedRectangle(
                cornerSize: CGSize(width:  geo.size.width / 5, height: geo.size.height / 5), style: .continuous
            )
            .fill(workLevel == 0 ?
                  Color.secondary.opacity(0.2) :
                      color.opacity(Double(workLevel) / 10.0))
            .overlay(
                RoundedRectangle(
                    cornerSize: CGSize(width:  geo.size.width / 5, height: geo.size.height / 5), style: .continuous
                )
                .strokeBorder(Color.primary.opacity(0.5), lineWidth: hover ? 1 : 0)
            )
            .onAppear {
                rect = geo.frame(in: .named("container"))
            }
        }
        .aspectRatio(1.0, contentMode: .fit)
        .scaleEffect(scale)
        .animation(.default, value: scale)
        .onChange(of: viewModel.touchedLocation) { _ in
            if viewModel.checkContain(rect: self.rect) {
                viewModel.changeDate(date: date)
                scale = 1.4
                hover = true
            }else{
                scale = 1.0
                hover = false
            }
        }
        .onChange(of: viewModel.isDragEnd) { isDragEnd in
            if isDragEnd && viewModel.checkSelected(date: date) {
                scale = 1.4
                hover = true
            }
        }
    }
}
