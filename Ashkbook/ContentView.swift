//
//  ContentView.swift
//  Ashkbook
//
//  Created by Ashkan Goharfar on 2022-03-03.
//

import SwiftUI

struct ContentView: View {
    
    // grabbed facebook rgb color value
    let facebookBlue = UIColor(red: 23/255.0,
                               green: 120/255.0,
                               blue: 242/255.0,
                               alpha: 1)
    
    var body: some View {
        // Vertical stack
        VStack {
            // Horizontal stack
            HStack {
                // Assigne for grround color of text
                // Assign Font size

                Text("ashkbook")
                    .foregroundColor(Color(facebookBlue))
                    .font(.system(size: 48, weight: .bold, design: .default))

                // make a spacer to seprate text and sf symbol
                Spacer()
                
                // make SF Symbols which is Apple's very own assets symbols
                // change its size ,assign color, and get background color
                // use resizable to size up image and filll the frane completely
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                    .foregroundColor(Color(.secondaryLabel))
                    //  .background(Color.red)
                
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
