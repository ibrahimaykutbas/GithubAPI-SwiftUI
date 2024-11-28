import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("GitHub Username", text: $viewModel.username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                Task {
                    await viewModel.fetchUser()
                }
            } label: {
                Text("Fetch User")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            
            if let user = viewModel.user {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Username: \(user.login)")
                    Text("Repo Count: \(user.public_repos)")
                    Text("Followers: \(user.followers)")
                    Text("Following: \(user.following)")
                }
                .padding()
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
