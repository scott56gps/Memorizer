//
//  TokenStyling.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/9/26.
//
import SwiftUI

protocol TokenStyling {
    func style(_ token: RecitationResultToken) -> AttributedString
}
