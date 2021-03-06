//
//  NewsFeedView.swift
//  NewsFeedApp
//
//  Created by Aleksandr Chebotarev on 17.11.2021.
//

import SwiftUI

struct NewsFeedView: View {
    @ObservedObject var newsFeed = NewsFeed()
    
    var body: some View {
        NavigationView {
            List(newsFeed) { (article: NewsListItem) in
                NavigationLink(destination: NewListItemView(article: article)) {
                    NewListItemListView(article: article)
                        .onAppear {
                            self.newsFeed.loadMoreArticles(currentItem: article)
                    }
                }
            }
            .refreshable {
                     print("write your pull to refresh logic here")
                }
        .navigationBarTitle("Новости")
        }
    }
}

struct NewListItemView: View {
    var article: NewsListItem
    
    var body: some View {
        UrlWebView(urlToDisplay: URL(string: article.url)!)
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle(article.title)
    }
}

struct NewListItemListView: View {
    var article: NewsListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(article.title)")
                    .font(.headline)
            }
        }
    }
}


struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}
