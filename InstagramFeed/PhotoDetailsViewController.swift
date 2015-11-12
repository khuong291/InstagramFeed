
import UIKit

class PhotoDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var photoDetailsTableView: UITableView!
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
        let cell = photoDetailsTableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath) as! DetailPhotosCell


        /*let instagramDetail = photo[indexPath.row]
        let name = instagramDetail.valueForKeyPath("user.username") as? String
        cell.userCommentNameLabel.text = name

        let url = NSURL(string: instagram.valueForKeyPath("images.thumbnail.url") as! String)!
        cell.avatarUserCommentImageView.setImageWithURL(url)*/
        
        return cell
    }

}
