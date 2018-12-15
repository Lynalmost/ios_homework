import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        //添加图片
        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 400, height: 400))
        imageView.image =  UIImage(named: "light")
        view.addSubview(imageView)
        //添加button
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 20))
        button.setTitle("close Me", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        self.title = "Second"
    }
    @IBAction func btnClicked() {
        navigationController?.pushViewController(ThirdViewController(), animated: true)
    }


}
