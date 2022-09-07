//
//  ContentView.swift
//  WeSplitSwifUI
//
//  Created by Anastasiia Veremiichyk on 03/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercenage = 7
    private let tipPercentages = [0, 3, 5, 7, 10, 15, 20]
    @FocusState private var amountIsFocused: Bool
    
    private var currency: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currencyCode ?? "USD")
    }
    
    private var total: Double {
        let tipSelection = Double(tipPercenage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = total / peopleCount
        return amountPerPerson
    }
    
    @ViewBuilder var baseInputSectionView: some View {
        Section {
            TextField("Amount", value: $checkAmount, format: currency)
                .keyboardType(.decimalPad)
                .focused($amountIsFocused)

            Picker("Number of people", selection: $numberOfPeople) {
                ForEach(2 ..< 100) {
                    Text("\($0) people")
                }
            }
        }
    }
    
    @ViewBuilder var tipInputSectionView: some View {
        Section {
            Picker("Tip Percentage", selection: $tipPercenage) {
                ForEach(tipPercentages, id: \.self) {
                    Text($0, format: .percent)
                }
            }
            .pickerStyle(.segmented)
        } header: {
            Text("How much tip would you like to leave?")
        }
    }
    
    @ViewBuilder var totalSectionView: some View {
        Section {
            Text(total, format: currency)
        } header: {
            Text("Total")
        }
    }
    
    @ViewBuilder var perPersonSectionView: some View {
        Section {
            Text(totalPerPerson, format: currency)
        } header: {
            Text("Amount per person")
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                baseInputSectionView
                tipInputSectionView
                totalSectionView
                perPersonSectionView
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
