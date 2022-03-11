import UIKit

func makePostREquest() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        return
    }
    
    var request  = URLRequest(url: url)
    //methods,body, headers
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String:AnyHashable] = [
        "userId": 1,
        "title": "Hello fron Hit",
        "body" : "Testing post request",
        
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    //make the request
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        do {
            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print("SUCCESS: \(response)")
        }
        catch {
            print(error)
        }
    }
    task.resume()
    
}

makePostREquest()
