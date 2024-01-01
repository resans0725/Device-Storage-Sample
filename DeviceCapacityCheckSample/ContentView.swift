//
//  ContentView.swift
//  DeviceCapacityCheckSample
//
//  Created by 永井涼 on 2023/12/30.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            Text("Device Capacity")
                .font(.title)
                .padding()
            
            Text(viewModel.deviceCapacity)
                .font(.headline)
                .padding()
                .onAppear {
                    viewModel.onAppear()
                }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Low Storage Alert"),
                message: Text("Your device's free space is less than 100MB."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
