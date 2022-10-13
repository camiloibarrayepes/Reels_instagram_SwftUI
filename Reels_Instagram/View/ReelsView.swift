//
//  ReelsView.swift
//  Reels_Instagram
//
//  Created by Camilo Ibarra yepes on 9/10/22.
//

import SwiftUI
import AVKit

struct ReelsView: View {
    @State var currentReel = ""
    @State var reels = MediaFileJSON.map { item -> Reel in
        let url = Bundle.main.path(forResource: item.url, ofType: "mp4") ?? ""
        let player = AVPlayer(url: URL(fileURLWithPath: url))
        return Reel(player: player, mediaFile: item)
    }
    var body: some View {
        // Vertical page tab view
        GeometryReader{ proxy in
            let size = proxy.size
            
            TabView(selection: $currentReel) {
                ForEach($reels){ $reel in
                    ReelsPlayer(reel: $reel)
                    // setting width
                    .frame(width: size.width)
                    .rotationEffect(.init(degrees: -90))
                    .ignoresSafeArea(.all, edges: .top)
                }
            }
            .rotationEffect(.init(degrees: 90))
            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: size.width)
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.ignoresSafeArea())
    }
}

struct ReelsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ReelsPlayer: View {
    @Binding var reel: Reel
    
    // Expanding title if its clicked...
    @State var showMore = false
    
    var body: some View {
        ZStack {
            if let player = reel.player {
                CustomVideoPlayer(player: player)
                VStack {
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 15) {
                                Image("profile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                
                                Text("iJustine")
                                    .font(.callout.bold())
                                Button {
                                    
                                } label: {
                                    Text("Follow")
                                        .font(.caption.bold())
                                }
                            }
                            ZStack {
                                if showMore {
                                    ScrollView(.vertical, showsIndicators: false) {
                                        // Extra text
                                        Text(reel.mediaFile.title + sampleText)
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                    }.frame(height: 120)
                                } else {
                                    Button {
                                        withAnimation{showMore.toggle()}
                                    } label: {
                                        HStack {
                                            Text(reel.mediaFile.title)
                                                .font(.callout)
                                                .fontWeight(.semibold)
                                                .lineLimit(1)
                                            Text("more")
                                                .font(.callout.bold())
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.top, 6)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                            }
                        }
                        
                        Spacer(minLength: 20)
                        //List of buttons
                        ActionsButtons(reel: reel)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                .foregroundColor(.white)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

struct ActionsButtons: View {
    var reel: Reel
    var body: some View {
        VStack(spacing: 25) {
            Button {
                
            } label: {
                VStack(spacing: 10) {
                    Image(systemName: "suit.heart")
                        .font(.title)
                    Text("233k").font(.caption.bold())
                }
            }
            Button {
                
            } label: {
                VStack(spacing: 10) {
                    Image(systemName: "bubble.right")
                        .font(.title)
                    Text("120").font(.caption.bold())
                }
            }
            Button {
                
            } label: {
                VStack(spacing: 10) {
                    Image(systemName: "paperplane")
                        .font(.title)
                }
            }
            
            Button {
                
            } label: {
                Image("menu")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                // rotating
                    .rotationEffect(.init(degrees: 90))
                
            }
        }
    }
}

let sampleText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, bu"
