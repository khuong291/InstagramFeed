import UIKit
import AFNetworking

class InstagramViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var photos = [NSDictionary]()
    var refreshControl: UIRefreshControl!
    @IBOutlet var instagramTableView: UITableView!

    override func viewDidLoad() {

        super.viewDidLoad()

        self.title = "Instagram"
        fetchInstagram()
        refreshInstagram()

        instagramTableView.dataSource = self
        instagramTableView.delegate = self
    }

    func refreshInstagram() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "onRefresh", forControlEvents: .ValueChanged)
        self.instagramTableView.addSubview(refreshControl)
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    func onRefresh() {
        delay(2, closure: {
            self.fetchInstagram()
            self.instagramTableView.reloadData()
            self.refreshControl.endRefreshing()
        })
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
        let url2 = NSURL(string: instagram.valueForKeyPath("images.thumbnail.url") as! String)!
        cell.av.setImageWithURL(url2)
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2;
        cell.thumbnailImageView.clipsToBounds = true;

        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let photoDetailsViewController = segue.destinationViewController as! PhotoDetailsViewController
        let indexPath = instagramTableView.indexPathForCell(sender as! UITableViewCell)
        let instagram = photos[indexPath!.row]
        photoDetailsViewController.instagram = instagram
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
            //print("photos", self.photos)

            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.instagramTableView.reloadData()
            })
        }
        
        task.resume()
    }
}
