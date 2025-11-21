//
//  AppView.swift
//  IExpense
//
//  Created by Student on 11/3/25.
//

import SwiftUI


struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var expenses = Expenses()
    
    let types = ["Business", "Personal"]
    
    @State private var currency: String = "USD"
    
    let currencies = ["USD", "EUR"]
    
    @State private var title = "My Expense"

    
    var body: some View {
        NavigationStack {
            Form {
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: currency))
                    .keyboardType(.decimalPad)
                Picker("Select Currency", selection: $currency) {
                    ForEach(currencies, id: \.self) { currency in
                        Text(currency).tag(currency)
                    }
                }
            }
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: title, type: type, amount: amount, currency: currency)
                    expenses.items.append(item)
                    dismiss()
                }
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
