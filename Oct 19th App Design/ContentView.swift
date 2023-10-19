//
//  ContentView.swift
//  Oct 19th App Design
//
//  Created by ATLAS Checkout 6 Guest on 10/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Stay Local"
    @State private var isLiked: Bool = UserDefaults.standard.bool(forKey: "isLiked")
    @State private var cardExpanded = false
    
    func toggleLike() {
        isLiked.toggle()
        UserDefaults.standard.set(isLiked, forKey: "isLiked")
    }
    
    private var tabWidth: CGFloat = 100

    var body: some View {
        VStack {
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    
                    Spacer()
                    
                    HStack{
                        Spacer()
                            .frame(width: 10)
                        
                        ForEach(["Stay Local", "Go Global"], id: \.self) {
                            tab in
                            Text(tab)
                                .padding()
                                .font(.caption)
                                .background(selectedTab == tab ? Color.red : Color.red.opacity(0))
                                .cornerRadius(5)
                                .onTapGesture {
                                    withAnimation {
                                        self.selectedTab = tab
                                
                                    }
                                }
                            
                                
                        }
                        .padding(.vertical)
                        
                        Spacer()
                            .frame(width: 10)
                        
                    }
                    .background(Color.blue)
                    .frame(height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    
                    Spacer()
                    
                    Image("ProfilePicture")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                .padding(.horizontal, 20)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                        VStack {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    Text("Rec")
                                        .padding()
                                        .background(Color.red)
                                        .cornerRadius(15)
                                    Text("Experience")
                                        .padding()
                                        .background(Color.red)
                                        .cornerRadius(15)
                                    Text("Class")
                                        .padding()
                                        .background(Color.red)
                                        .cornerRadius(15)
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Image("ProfilePicture")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                        .padding(.leading, -5)
                                    Text("Jane Doe")
                                        .bold()
                                        .padding(.leading, 5)
                                        
                                    Spacer()
                                        .frame(width: 95)
                                    
                                    Button(action: toggleLike) {
                                        Image(systemName: isLiked ? "heart.fill" : "heart")
                                            
                                            .foregroundColor(isLiked ? .red : .black)
                                    }
                                    
                                    Image(systemName: "bookmark")
                                    Image(systemName: "message.badge")
                                    Text("2")
                                        .font(.callout)
                                        .padding(.leading, -5)
                                        .padding(.bottom, -25)
                                }
                                .padding()
                                
                                Text("12 October 2023")
                                    .font(.footnote)
                                    .padding(.horizontal)
                                Text("La Cuisine Paris: Dessert cooking class")
                                    .font(.headline)
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                                Text("Learn to make your own croissants!! The centrally located La Cuisine Paris cooking school has a range of culinary courses in English...")
                                    .font(.callout)
                                    .lineLimit(cardExpanded ? nil : 3)
                                    .padding()
                                    .padding(.top, -15)
                            }
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .frame(height: 200)
                            .onTapGesture {
                                withAnimation {
                                    cardExpanded.toggle()
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        .frame(height: 600)
                        .background(
                            Image("ProfilePicture")
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                        )
                        .shadow(radius: 10)
                        .padding(.bottom, 15)
                        .padding(.horizontal, 40)
                    
                }
            }
            
            Spacer()
            
            HStack {
                Image(systemName: "house.fill")
                Spacer()
                Image(systemName: "plus.circle.fill")
                Spacer()
                Image(systemName: "ticket")
            }
            .font(.title2)
            .padding(.horizontal, 80)

        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
