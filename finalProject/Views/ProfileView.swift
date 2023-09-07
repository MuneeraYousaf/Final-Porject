//
//  ProfileView.swift
//  finalProject
//
//  Created by Sarah on 04/09/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var users: UserDataViewModel
    var body: some View {
        ForEach(users.users, id: \.id){
            i in
            Text(i.email)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(UserDataViewModel())
    }
}
