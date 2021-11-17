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
                NavigationLink(destination: NewsListItemView(article: article)) {
                    NewsListItemListView(article: article)
                        .onAppear {
                            self.newsFeed.loadMoreArticles(currentItem: article)
                    }
                }
            }
        .navigationBarTitle("Новости")
        }
    }
}

struct NewsListItemView: View {
    var article: NewsListItem
    
    var body: some View {
        UrlWebView(urlToDisplay: URL(string: article.url)!)
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle(article.title)
    }
}

struct NewsListItemListView: View {
    var article: NewsListItem
    
    var body: some View {
        HStack {
            UrlImageView(urlString: article.urlToImage)
            VStack(alignment: .leading) {
                Text("\(article.title)")
                    .font(.headline)
                Text("\(article.author ?? "No Author")")
                    .font(.subheadline)
            }
        }
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}
