
import UIKit

class PhotoDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var instagram: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath) as! DetailPhotosCell

        /*let instagram = photos[indexPath.row]
        let usernames = instagram.valueForKeyPath("likes.data") as! [NSDictionary]
        let username = usernames.first!

        let name = username.valueForKeyPath("username") as? String

        cell.userNameLabel.text = name

        let url = NSURL(string: instagram.valueForKeyPath("images.thumbnail.url") as! String)!
        cell.thumbnailImageView.setImageWithURL(url)
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2;
        cell.thumbnailImageView.clipsToBounds = true;*/
        
        return cell
    }

}
