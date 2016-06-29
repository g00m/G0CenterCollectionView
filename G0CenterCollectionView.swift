
import UIKit

class G0CenterCollectionView : UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var left_right_padding : CGFloat = 20.0
    var item_width : CGFloat = 320.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initComponents()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initComponents()
    }
    
    func initComponents () {
        delegate = self
        dataSource = self
        
        let layout : UICollectionViewFlowLayout = CenterCellCollectionViewFlowLayout()
        layout.itemSize = CGSize(width: item_width - left_right_padding, height: item_width - left_right_padding)
        layout.scrollDirection = .Horizontal
        
        self.setCollectionViewLayout(layout, animated: false)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        var insets = self.contentInset
        
        let value = (self.frame.size.width - (collectionViewLayout as! UICollectionViewFlowLayout).itemSize.width) * 0.5
        insets.left = value
        insets.right = value
        self.contentInset = insets
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("center_cell", forIndexPath: indexPath)
        
        cell.backgroundColor = getRandomColor()
        
        return cell
    }
    
    func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
}

