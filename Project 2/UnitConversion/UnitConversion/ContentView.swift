//
//  ContentView.swift
//  UnitConversion
//
//  Created by Yasin Aktaş on 3.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    let units = ["Meter","Kilometer","Feet","Yard","Mile"]
    
    @FocusState private var isKeyboardFocused:Bool
    
    @State private var selectedInputUnit = "Meter"
    @State private var selectedOutputUnit = "Meter"
    @State private var input = 0
    
    var meterValue = {(input:Int,selection:String)->Double in
        if selection == "Meter"{
            return Double(input)
        }
        if selection == "Kilometer"{
            return Double(input) * 1000
        }
        if selection == "Feet"{
            return Double(input) * 0.3048
        }
        if selection == "Yard"{
            return Double(input) * 0.9144
        }
        if selection == "Mile"{
            return Double(input) * 1609.34
        }
        return Double(input)
    }
    
    var output:Double{
        let meterValue = meterValue(input,selectedInputUnit)
        if selectedOutputUnit == "Meter"{
            return meterValue
        }
        if selectedOutputUnit == "Kilometer"{
            return meterValue / 1000
        }
        if selectedOutputUnit == "Feet"{
            return meterValue / 0.3048
        }
        if selectedOutputUnit == "Yard"{
            return meterValue / 0.9144
        }
        if selectedOutputUnit == "Mile"{
            return meterValue / 1609.34
        }
        return meterValue
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Input Unit",selection:$selectedInputUnit){
                        ForEach(units,id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }header:{
                    Text("Select a unit to convert from")
                }
                Section{
                    TextField("Input",value:$input,format:.number)
                        .keyboardType(.numberPad)
                        .focused($isKeyboardFocused)
                }header:{
                    Text("Input")
                }
                Section{
                    Picker("Output Unit",selection:$selectedOutputUnit){
                        ForEach(units,id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }header:{
                    Text("Select a unit to convert to")
                }
                Section{
                    Text(output,format:.number)
                }header:{
                    Text("Result")
                }
            }
            .navigationTitle("Unit Converison")
            .toolbar{
                ToolbarItemGroup(placement:.keyboard){
                    Spacer()
                    Button("Done"){
                        isKeyboardFocused = false
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
