//
//  ContentView.swift
//  Ashkbook
//
//  Created by Ashkan Goharfar on 2022-03-03.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var text: String
    
    let stories = ["story1", "story2", "story3", "story1", "story2", "story3"]
    
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
            
            // First parameter is placeholder
            // $ is for update the UI based on the text in real time
            TextField("Search...", text: $text)
                .padding(7)
                .background(Color(.systemGray5))
                .cornerRadius(13)
                .padding(.horizontal, 15)

            // everything are going to stacked up of each other
            // Added scrolling stories horizontally
            ZStack {
                Color(.secondarySystemBackground)
                
                ScrollView(.vertical) {
                    VStack {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 3) {
                                ForEach(stories, id: \.self) { name in
                                    Image(name)
                                        // Add aspect ratio to modify the image size to the frame size
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    
                                        .frame(width: 140, height: 200, alignment: .center)
                                        .background(Color.red)
                                    
                                        // fianly clipped it here
                                        .clipped()
//                                    Spacer()
                                }
                            }
                            .padding()
                        }
                        
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // 
        ContentView(text: .constant(""))
    }
}
