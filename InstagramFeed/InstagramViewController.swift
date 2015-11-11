import UIKit
import AFNetworking

class InstagramViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var photos = [NSDictionary]()
    @IBOutlet var instagramTableView: UITableView!

    override func viewDidLoad() {

        super.viewDidLoad()

        fetchInstagram()

        instagramTableView.dataSource = self
        instagramTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let photos: [NSDictionary] = photos {
            return photos.count
        } else {
            return 0
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        instagramTableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = instagramTableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PhotosCell

        let instagram = photos[indexPath.row]
        let usernames = instagram.valueForKeyPath("likes.data") as! [NSDictionary]
        let username = usernames.first!

        let name = username.valueForKeyPath("username") as? String

        cell.userNameLabel.text = name

        let url = NSURL(string: instagram.valueForKeyPath("images.thumbnail.url") as! String)!
        cell.thumbnailImageView.setImageWithURL(url)

        return cell
    }

    func fetchInstagram(){
        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=0f6d7722e11746969c2aaeae0f42b960")
        let session = NSURLSession.sharedSession()

        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            guard error == nil else  {
                print("error loading from URL", error!)
                return
            }

            let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
            self.photos = json["data"] as! [NSDictionary]
            print("photos", self.photos)

            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.instagramTableView.reloadData()
            })
        }
        
        task.resume()
    }
}
