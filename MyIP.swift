let url: URL! = URL(string: "https://api.ipify.org?format=json")

URLSession.shared.dataTask(with: url, completionHandler: {data,_,_ in
  do {
    guard let data = data else { return }
      if let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
        for (key,value) in jsonData {
          print("\(key): \(value)")
        }
      }
  } catch {
    print(error.localizedDescription)
  }
}).resume()
