

import Foundation

class Houses {
    var houseArray: [HouseInfo] = []
    var urlString = "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=50"
    var pageNum = 1
    var isFetching = false
    
    func getData (completed: @escaping ()->()) {
        print("We are acessing URL \(urlString)")
        
        guard let url = URL(string: urlString) else {
            guard !isFetching else {
                return
            }
            isFetching = true
            
            print("ERROR: Could not create URL from \(urlString)")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            do {
                self.houseArray = try JSONDecoder().decode([HouseInfo].self, from: data!)
                print("Here is what was returned \(self.houseArray)")
            } catch {
                print("JSON ERROR")
            }
            self.isFetching = false
            completed()
        }
        task.resume()
    }
}
