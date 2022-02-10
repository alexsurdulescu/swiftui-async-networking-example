//
//  ActivityView.swift
//  async-networking-example
//
//  Created by Alexandru Surdulescu on 10/02/2022.
//

import SwiftUI

struct ActivityView: View {
    
    let activity: Activity
    
    var body: some View {
        VStack {
            Text(activity.activity)
                .font(.title3)
                .padding()
            
            HStack {
                Text("Participants: ")
                
                Text("\(activity.participants)")
            }
            
            HStack {
                Text("Type: ")
                
                Text(activity.type)
            }
            
            if !activity.price.isZero {
                HStack {
                    Text("Price: ")
                    
                    Text("\(activity.price, specifier: "%.2f")")
                }
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activity: Activity(activity: "activity", type: "-", participants: 1, price: 0.0, link: "", key: "", accessibility: 0.0))
    }
}
