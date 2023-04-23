//
//  SecondScreen.swift
//  NewProject2
//
//  Created by Indira on 13/4/23.
//

import SwiftUI

struct SecondScreen: View {
    @State var text: String = ""
    var body: some View {
        SearchView(text: $text)
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
