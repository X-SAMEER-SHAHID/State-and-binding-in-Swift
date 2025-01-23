//
//  ContentView.swift
//  state and binding in swift 1.0
//
//  Created by Sameer,s Macbook on 1/22/25.
//

// part no 1

// import SwiftUI

// struct ContentView: View {
//         // state like the storage continaner in a memory that can gives you the data when some view render that id depended on it
//     @State private var count : Int = 0
    
//     var body: some View {
//         VStack {
//             // swift ui understand that what view is depend and what is not
//             Text("Count: \(count)")
//                .font(.largeTitle)
//                .padding()
            
//             Button("Increment")
//             {
//                 count += 1
//             }
//             .padding()
            
//             Button("Decrement")
//             {
//                 count -= 1
//             }
//             .padding()
        
            
//         }
//         .padding()
//     }
// }

// #Preview {
//     ContentView()
// }


//More examples of states

// import SwiftUI

// struct ContentView: View {
//         // state like the storage continaner in a memory that can gives you the data when some view render that id depended on it
//     @State private var ison : Bool = false
    
//     var body: some View {
//         VStack {
//             Toggle(isOn: $ison, label: {
//                 Text(ison ? "ON" : "OFF")
//             }).fixedSize()
//         }
//         .frame(maxWidth: .infinity, maxHeight: .infinity)
//         .background(ison ? .green : .red)
//     }
// }

// #Preview {
//     ContentView()
// }




// LIST IN SWIFT UI

// import SwiftUI

// struct ContentView: View {
//         // state like the storage continaner in a memory that can gives you the data when some view render that id depended on it
//     @State private var name : String = ""
//     @State private var friends : [String] = []

//     var body: some View {
//         VStack{
//             TextField("Enter Name", text: $name)
//                 .textFieldStyle(.roundedBorder)
//                 .onSubmit {
//                     friends.append(name)
//                     name = "" 
//                 }
//             // id means that friends in a array are uniquely idenfify by the id and id is hasble which is reprentable in form of self
            
//             List(friends , id : \.self) {friend in
//                 Text(friend)
//             }
//             Spacer()
            
            
            
//         }.padding()
//     }
// }

// #Preview {
//     ContentView()
// }



// More content of List


// import SwiftUI

// struct ContentView: View {
//     @State private var search : String = ""
//     @State private var friends : [String] = ["John","Marry","Steve","Steven","Jerry","Sameer","Haseeb","ALi"]
//     @State private var filteredfriends : [String] = []

//     var body: some View {
//         VStack{
            
//             List(filteredfriends, id: \.self) { friend in
//                 Text(friend)
//             }
//             .listStyle(.plain)
//             // need a navigation stack in preview and also the main app file
//             .searchable(text: $search)
//             // New onChange syntax (Swift 5.9+)
//             // This modifier observes changes in the search value
//             // oldValue: contains the previous search text
//             // newValue: contains the current/updated search text
//             .onChange(of: search) { oldValue, newValue in
//                 if newValue.isEmpty {
//                     // If search field is empty, show all friends
//                     filteredfriends = friends
//                 } else {
//                     // Filter friends array based on search text
//                     // lowercased() makes the search case-insensitive
//                     filteredfriends = friends.filter { 
//                         $0.lowercased().contains(newValue.lowercased())
//                     }
//                 }
//             }
            
//             Spacer()
            
//         }
//         .padding()
//         .navigationTitle("Friends")
//         .onAppear {
//             filteredfriends = friends
//         }
//     }
// }

// #Preview {
//     NavigationStack{
        
//     ContentView()
        
//     }
// }




// Binding in Swift Ui

import SwiftUI
struct lightbuldview : View {
    @Binding var isOn : Bool
    
    var body: some View {
        VStack{
            Image(systemName: "lightbulb")
                .font(.largeTitle)
                .foregroundColor(isOn ? .yellow : .black)
            Button("Toggle"){
                isOn.toggle()
            }
            .foregroundColor(.black)
        }
    }
}
struct ContentView: View {
    @State private var islighton: Bool = false
    
    var body: some View {
        VStack{
            // we can simply call the other view of chid view in a view in that way
            // we can simply pass the value of child var if it bindable to var of parnet and when child changes that var the parent also rerender it self
            lightbuldview(isOn :$islighton)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        // contentview want to know that when he toggle is one in lightbulbview where the binding comes in places
        .background(islighton ? .blue : .red)
       
    }
}

#Preview {
    ContentView()
}



