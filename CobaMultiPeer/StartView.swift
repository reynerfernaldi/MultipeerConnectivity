//
//  StartView.swift
//  CobaMultiPeer
//
//  Created by Reyner Fernaldi on 13/08/23.
//

import SwiftUI

struct StartView: View {
    @State var rpsSession: RPSMultipeerSession?
    @State var currentView: Int = 0
    @State var username = ""
    var body: some View {
        
        switch currentView {
        case 1:
            PairView()
                .environmentObject(rpsSession!)
        case 2:
            KitchenView()
                .environmentObject(rpsSession!)
        default:
            startViewBody
        }
    }
    
    var startViewBody: some View {
        VStack{
            TextField("Nickname", text: $username)
                .padding([.horizontal], 75.0)
                .padding(.bottom, 24)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Order") {
                rpsSession = RPSMultipeerSession(username: username)
                currentView = 1
            }
            Button("Server") {
                rpsSession = RPSMultipeerSession(username: username)
                currentView = 2
            }
        }
        
        //        VStack {
        //            Spacer()
        //            Image(systemName: "scissors.circle.fill")
        //                .resizable()
        //                .foregroundColor(.accentColor)
        //                .frame(width: 200, height: 200)
        //            Text("💥RPS💥")
        //                .fontWeight(.heavy)
        //                .font(.largeTitle)
        //            Text("Enter a nickname below. Choose something your friend will recognize!")
        //                .font(.caption2)
        //                .fontWeight(.semibold)
        //                .padding(.horizontal, 40)
        //                .multilineTextAlignment(.center)
        //            TextField("Nickname", text: $username)
        //                .padding([.horizontal], 75.0)
        //                .padding(.bottom, 24)
        //                .textFieldStyle(RoundedBorderTextFieldStyle())
        //            Button("Continue →") {
        //                rpsSession = RPSMultipeerSession(username: username)
        //                currentView = 1
        //            }.buttonStyle(BorderlessButtonStyle())
        //                .padding(.horizontal, 30)
        //                .padding(.vertical, 15)
        //                .foregroundColor(.white)
        //                .background(Color.accentColor)
        //                .cornerRadius(12)
        //                .disabled(username.isEmpty ? true : false)
        //
        //
        //            Spacer()
        //        }
        //    }
    }
    
    struct StartView_Previews: PreviewProvider {
        static var previews: some View {
            StartView()
        }
    }
}
