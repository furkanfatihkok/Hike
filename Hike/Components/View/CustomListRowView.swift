//
//  CustomListRowView.swift
//  Hike
//
//  Created by FFK on 16.10.2023.
//

import SwiftUI

struct CustomListRowView: View {
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    
    var body: some View {
        LabeledContent {
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                .fontWeight(.heavy)
            } else if(rowLinkLabel != nil && rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            }
            else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                Text(rowLabel)
            }
        }
    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: nil, rowTintColor: .pink, rowLinkLabel: "Linkedin", rowLinkDestination: "https://www.linkedin.com/in/furkanfatihkok/")
        }
    }
}
