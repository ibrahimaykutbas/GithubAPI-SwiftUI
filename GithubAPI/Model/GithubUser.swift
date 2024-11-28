import Foundation

struct GithubUser: Decodable {
    let login: String
    let avatar_url: String
    let public_repos: Int
    let followers: Int
    let following: Int
}
