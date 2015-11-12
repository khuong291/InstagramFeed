
import UIKit

class PhotoDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var instagram: NSDictionary!

    @IBOutlet var avatarUserCommentImageView: UIImageView!
    @IBOutlet var userCommentNameLabel: UILabel!
    @IBOutlet var userCommentLineTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    }

}
