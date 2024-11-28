import Foundation

@MainActor
class UserViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var user: GithubUser?
    @Published var errorMessage: String?
    
    func fetchUser() async {
        let urlString = "https://api.github.com/users/\(username)"
        
        do {
            let user: GithubUser = try await NetworkManager.shared.fetchData(from: urlString)
            self.user = user
            self.errorMessage = nil
        } catch {
            self.errorMessage = error.localizedDescription
            self.user = nil
        }
    }
}
