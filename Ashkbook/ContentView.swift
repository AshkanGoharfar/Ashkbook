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
//                                         Spacer()
                                }
                            }
                            .padding()
                        }
                        
                        // Add FaceBook Post
                        FBPost(name: "Ashkan Goharfar", post: "Hello, welcome to Ashkogram, I hope you enjoy this app and its features, peace!!", imageName: "person1")
                        Spacer()
                        
                        FBPost(name: "Akash Raju", post: "Hello every one, nice to meet you", imageName: "person2")
                        Spacer()
                        
                        FBPost(name: "Brad Pit", post: "I like this application very much. I hope I can see other version of this application very soon.", imageName: "person3")
                        Spacer()
                        
                    }
                }
            }
            
            Spacer()
        }
    }
}


// Ashkbook post view
struct FBPost: View  {
    
    // variables of every post
    let name: String
    let post: String
    let imageName: String
    
    var body: some View {
        VStack {
            
            // Profile picture and name
            HStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(50/2)
                
                VStack {
                    HStack {
                        Text(name)
                            .foregroundColor(Color.blue)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                        Spacer()
                    }
                    
                    HStack {
                        Text("14 minutes ago")
                            .foregroundColor(Color(.secondaryLabel))
                        Spacer()
                    }

                }
                Spacer()
            }
            Spacer()
            
            // Actual post
            HStack {
                Text(post)
                    .font(.system(size: 24, weight: .regular, design: .default))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
            Spacer()
            
            // Comment like share button
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Like")
                })
                
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Comment")
                })
                
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Share")
                })
                
            }
            .padding()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(7)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // 
        ContentView(text: .constant(""))
    }
}
