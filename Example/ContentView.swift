//
//  ContentView.swift
//  Example
//
//  Created by macOS on 8/3/21.
//

import SwiftUI

struct ContentView: View {
    @State var tags: [String] = []
    @State var keyword: String = ""
    
    var allTags: [String] = ["Java", "Python", "JavaScript", "Php", "Swift", "SQL", "Ruby", "Objective-C", "Go", "Assembly", "Basic", "Html", "React", "Kotlin", "C++", "C#"]
    
    var body: some View {
        VStack(spacing: 1) {
            searchView
            Divider()
            searchResultView
        }
    }
    
    var theme: TagTheme {
        return TagTheme(font: Font.system(size: 15), foregroundColor: Color.white, backgroundColor: Color.black, borderColor: Color.white, shadowColor: Color.green, deletable: false, deleteButtonSize: 10, deleteButtonColor: Color.yellow, spacing: 5, alignment: .leading, inputFieldTextColor: Color.black)
    }
    
    @ViewBuilder
    var searchView: some View {
        HStack(alignment: .top, spacing: 10) {
            Text("To")
                .padding(.top, 4)
            TagTextField(tags: $tags, keyword: $keyword, theme: self.theme, placeholder: "Tags") { _ in
                return allTags.filter{$0.lowercased().contains(keyword.lowercased()) == true}.first
            }
            .padding(6)
            .background(Color(.sRGB, red: 224.0/255.0, green: 224.0/255.0, blue: 225.0/255.0, opacity: 1))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .padding(16)
    }
    
    @ViewBuilder
    var searchResultView: some View {
        if (allTags.filter{$0.lowercased().contains(keyword.lowercased()) == true}).count > 0 {
            List {
                ForEach((allTags.filter{$0.lowercased().contains(keyword.lowercased()) == true}), id: \.self) { tag in
                    Button(action: {
                        if tags.contains(tag) == false {
                            tags.append(tag)
                        }
                        keyword = ""
                    }, label: {
                        Text(tag)
                            .padding()
                    })
                    .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                }
            }
        }
        else {
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                
                Text("No tags found")
                    .font(Font.system(size: 16))
                    .foregroundColor(Color.secondary)
                    .padding(.top, 20)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
