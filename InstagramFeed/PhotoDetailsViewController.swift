
import UIKit
import AFNetworking

class PhotoDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var photoDetailImageView: UIImageView!
    @IBOutlet var photoDetailsTableView: UITableView!

    var instagram: NSDictionary!
    var comments: [NSDictionary]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: instagram.valueForKeyPath("images.standard_resolution.url") as! String)!
        photoDetailImageView.setImageWithURL(url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = photoDetailsTableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath) as! DetailPhotosCell

        let data = comments[indexPath.row]
        let userCommentName = data.valueForKeyPath("from.full_name") as! String
        cell.userCommentNameLabel.text = userCommentName
        let userCommentContent = data.valueForKeyPath("text") as! String
        cell.contentComentTextView.text = userCommentContent

        let url = NSURL(string: data.valueForKeyPath("from.profile_picture") as! String)!
        cell.avatarUserCommentImageView.setImageWithURL(url)

        cell.avatarUserCommentImageView.layer.cornerRadius = cell.avatarUserCommentImageView.frame.size.width / 2;
        cell.avatarUserCommentImageView.layer.borderWidth = 1.0
        cell.avatarUserCommentImageView.layer.masksToBounds = false
        cell.avatarUserCommentImageView.layer.borderColor = UIColor.whiteColor().CGColor
        cell.avatarUserCommentImageView.clipsToBounds = true;
        
        return cell
    }

}
