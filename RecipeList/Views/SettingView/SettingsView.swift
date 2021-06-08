//
//  SettingsView.swift
//  Fruits
//
//  Created by DHV on 30/05/2021.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
 
                    GroupBox(label:
                        SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    ) {
                        SettingRowView(name: "Developer", content: "DHV10")
                        SettingRowView(name: "Designer", content: "DHV10")
                        SettingRowView(name: "Compatibility", content: "iOS 14")
                        
                        SettingRowView(name: "Facebook",  linkLabel: "Duong Hoang Viet", linkDestination: "www.facebook.com/dhv1812")
                        
                        SettingRowView(name: "SwiftUI", content: "2.0")
                        SettingRowView(name: "Version", content: "1.0")
                    }
                     
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                trailing:
                    Button(action: {
                        //
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark").foregroundColor(.black)
                    }
                )
                .padding()
            }
        }
    }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
