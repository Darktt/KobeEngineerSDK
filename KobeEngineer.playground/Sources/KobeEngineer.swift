import Foundation

public typealias KobeCompletionHandler = (NSURL?, NSError?) -> Void

public struct KobeEngineer
{
    private var kobeURL: NSURL {
        let kobeURLString: String = "http://curl.kobe.ga/" + (self.imageStyle ? "img" : "")
        
        return NSURL(string: kobeURLString)!
    }
    
    public var message: String?
    public var imageStyle: Bool = false
    
    public init(message: String, imageStyle: Bool = false)
    {
        self.message = message
        self.imageStyle = imageStyle
    }
    
    public func sendKobeMessage(completionHandler: KobeCompletionHandler?)
    {
        guard let _completionHandler = completionHandler else {
            return;
        }
        
        let postData: NSData = "msg=\(self.message!)".dataUsingEncoding(NSUTF8StringEncoding)!
        
        let URLRequest: NSMutableURLRequest = NSMutableURLRequest(URL: self.kobeURL)
        URLRequest.HTTPMethod = "POST"
        URLRequest.HTTPBody = postData
        
        func postResponse(data: NSData?, response: NSURLResponse?, error: NSError?)
        {
            if let error = error {
                _completionHandler(nil, error)
                
                return;
            }
            
            if let data = data {
                let responseString: String = String(data: data, encoding: NSUTF8StringEncoding)!
                
                let searchString: String = "https://engineer.kobe.ga/"
                let range: Range<String.Index> = responseString.rangeOfString(searchString)!
                let length: Int = searchString.startIndex.distanceTo(searchString.endIndex)
                let endIndex: String.Index = range.startIndex.advancedBy(length + 9)
                let URLString: String = responseString[range.startIndex ..< endIndex]
                let URL: NSURL = NSURL(string: URLString)!
                
                _completionHandler(URL, nil)
            }
        }
        
        let sessionConfiguration: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session: NSURLSession = NSURLSession(configuration: sessionConfiguration)
        let dataTask: NSURLSessionDataTask = session.dataTaskWithRequest(URLRequest, completionHandler: postResponse)
        dataTask.resume()
    }
}