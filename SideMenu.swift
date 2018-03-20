sender.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.revealViewController().tapGestureRecognizer()
        self.revealViewController().panGestureRecognizer()

//Load view on center
reviewView =  Bundle.main.loadNibNamed("AddReviewView", owner: self, options: nil)?[0] as? AddReviewView
        reviewView?.reviewDelegate = self
        reviewView?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        reviewView?.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        reviewView?.layer.masksToBounds = true
        self.view.addSubview(reviewView!)
