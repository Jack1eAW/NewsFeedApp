//
//  MainView.swift
//  NewsFeedApp
//
//  Created by Aleksandr Chebotarev on 17.11.2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Full News", systemImage: "newspaper")
                }

            NewsFeedView()
                .tabItem {
                    Label("List Of News", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
