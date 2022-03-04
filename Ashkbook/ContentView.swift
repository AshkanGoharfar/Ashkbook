//
//  ContentView.swift
//  Ashkbook
//
//  Created by Ashkan Goharfar on 2022-03-03.
//

import SwiftUI

// Convert variable to hashable, because whenever a for loop executes it needs to be able to specify an unique id for the actual elementa\ and when you make something hashable it makes itbasically uniquein the sense of every single element with the different valeus for the name post and image name are goinf to be unique are goinf to be unique and you are going to compute rather swift ui is going to compute unique hash just some string value to represent it.
struct FBPostModel: Hashable {
    // variables of every post
    let name: String
    let post: String
    let imageName: String
}

struct ContentView: View {
    
    @Binding var text: String
    
    let stories = ["story1", "story2", "story3", "story1", "story2", "story3"]
    
    let posts: [FBPostModel] = [
        FBPostModel(name: "Ashkan Goharfar", post: "Hello, welcome to Ashkogram, I hope you enjoy this app and its features, peace!!", imageName: "person1"),
        FBPostModel(name: "Akash Raju", post: "Hello every one, nice to meet you", imageName: "person2"),
        FBPostModel(name: "Brad Pit", post: "I like this application very much. I hope I can see other version of this application very soon.", imageName: "person3")]
    
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
                        
                        StoriesView(stories: stories)
                        
                        // Add FaceBook Post
                        ForEach(posts, id: \.self) { model in
                            FBPost(model: model)
                            Spacer()
                        }
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct StoriesView: View {
    
    let stories: [String]
    
    var body: some View {
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
    }
}


// Ashkbook post view
struct FBPost: View  {
    
    @State var isLiked: Bool = false
    
    let model: FBPostModel

    
    var body: some View {
        VStack {
            
            // Profile picture and name
            HStack {
                Image(model.imageName)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(50/2)
                
                VStack {
                    HStack {
                        Text(model.name)
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
                Text(model.post)
                    .font(.system(size: 24, weight: .regular, design: .default))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
            Spacer()
            
            // Comment like share button
            HStack {
                Button(action: {
                    isLiked.toggle()
                }, label: {
                    Text(isLiked ? "Liked" : "Like")
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
