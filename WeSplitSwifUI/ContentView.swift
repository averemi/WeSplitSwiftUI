//
//  ContentView.swift
//  WeSplitSwifUI
//
//  Created by Anastasiia Veremiichyk on 03/09/2022.
//

import SwiftUI

struct ContentView: View {
    /// Show the value of this property here
    @State private var tapCount = 0
    /// Two-way binding: show the value of this property here, but write any changes back to this property - whatever is in the text is also in the name of the property
    @State private var name = ""

    /// Our views are the function of their state - everything the user can see is just the visible representation of the structs and properties in our code
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Button ("Tap Count: \(tapCount)") {
                        tapCount += 1
                    }
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                    ForEach(0 ..< 100) {
                        Text("Row \($0)")
                    }
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
