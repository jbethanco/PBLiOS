//
//  Font.swift
//  PBLiOS
//
//  Created by John Bethancourt on 12/24/20.
//

import Foundation
import SwiftUI

// Provide our custom font, but with dynamic font size

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
struct CustomFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory

    var name: String
    var style: UIFont.TextStyle
    var weight: Font.Weight = .regular

    func body(content: Content) -> some View {
        return content.font(Font.custom(
            name,
            size: UIFont.preferredFont(forTextStyle: style).pointSize)
            .weight(weight))
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    
    func dmSansFontBold(
        style: UIFont.TextStyle,
        weight: Font.Weight = .regular) -> some View {
        return self.modifier(CustomFont(name: "DMSans-Bold", style: style, weight: weight))
    }
    
    func dmSansFontMedium(
        style: UIFont.TextStyle,
        weight: Font.Weight = .regular) -> some View {
        return self.modifier(CustomFont(name: "DMSans-Medium", style: style, weight: weight))
    }
    
    func dmSansFont(
        style: UIFont.TextStyle,
        weight: Font.Weight = .regular) -> some View {
        return self.modifier(CustomFont(name: "DMSans-Regular", style: style, weight: weight))
    }
    
    func customFont(
        name: String,
        style: UIFont.TextStyle,
        weight: Font.Weight = .regular) -> some View {
        return self.modifier(CustomFont(name: name, style: style, weight: weight))
    }
}
 

