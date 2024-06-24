//
//  SettingsView.swift
//  Mini 2
//
//  Created by Jasmine Mutia Alifa on 24/06/24.
//

import SwiftUI


struct Device: Identifiable {
    let id = UUID()
    var name: String
    var lastActive: String
}

struct SettingsView: View {
    @State private var devices = [
        Device(name: "iPhone 12", lastActive: "1 day ago"),
        Device(name: "iPad Pro", lastActive: "2 days ago"),
        Device(name: "iPhone 13", lastActive: "3 days ago")
    ]
    @State private var showAlert = false
    @State private var selectedDevice: Device?

    var body: some View {
        VStack {
            Text("Logged-in Devices")
                .font(.system(size: 20))
                .bold()
                .padding(.top, 20)

            List {
                ForEach(devices) { device in
                    Button(action: {
                        selectedDevice = device
                        showAlert = true
                    }) {
                        HStack {
                            Text(device.name)
                                .font(.system(size: 18))
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Text("Last Active: \(device.lastActive)")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 10)
                    }
                }
                .onDelete(perform: delete)
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Settings")
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Logout"),
                message: Text("Successfully logged out from this device."),
                dismissButton: .default(Text("OK"), action: {
                    if let selectedDevice = selectedDevice {
                        deleteDevice(selectedDevice)
                    }
                })
            )
        }
    }
    
    private func delete(at offsets: IndexSet) {
        devices.remove(atOffsets: offsets)
    }
    
    private func deleteDevice(_ device: Device) {
        if let index = devices.firstIndex(where: { $0.id == device.id }) {
            devices.remove(at: index)
        }
    }
}

#Preview {
    SettingsView()
}
