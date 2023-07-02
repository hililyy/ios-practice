import UIKit
import CropPickerView

class ViewController: UIViewController {
    @IBOutlet weak var cropContainerView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var rotationButton: UIButton!
    var image: UIImage?
    var angle: Double = 0.0
    
    private let cropPickerView: CropPickerView = {
        let cropPickerView = CropPickerView()
        cropPickerView.translatesAutoresizingMaskIntoConstraints = false
        cropPickerView.backgroundColor = .black
        return cropPickerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cropContainerView.addSubview(self.cropPickerView)
        
        self.cropContainerView.addConstraints([
            NSLayoutConstraint(item: self.cropContainerView!, attribute: .top, relatedBy: .equal, toItem: self.cropPickerView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.cropContainerView!, attribute: .bottom, relatedBy: .equal, toItem: self.cropPickerView, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.cropContainerView!, attribute: .leading, relatedBy: .equal, toItem: self.cropPickerView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.cropContainerView!, attribute: .trailing, relatedBy: .equal, toItem: self.cropPickerView, attribute: .trailing, multiplier: 1, constant: 0)
        ])

        self.cropPickerView.delegate = self

        DispatchQueue.main.async {
            guard let image = self.image else { return }
            self.cropPickerView.image(image)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextButton.addTarget(self, action: #selector(self.cropTap(_:)), for: .touchUpInside)
        
        rotationButton.addTarget(self, action: #selector(self.rotationTap(_:)), for: .touchUpInside)
    }

    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @objc func cropTap(_ sender: UIBarButtonItem) {
        self.cropPickerView.crop { (crop) in
            
            let imageView = UIImageView(frame: self.view.frame)
            imageView.contentMode = .scaleAspectFit
            imageView.image = crop.image
            imageView.transform = CGAffineTransform(rotationAngle: self.angle)
//            self.view.addSubview(imageView)
            
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            vc.img = self.saveRotatedImageFromImageView(imageView: imageView)
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
            
        }
    }
    
    @objc func rotationTap(_ sender: UIBarButtonItem) {
        self.angle += (-.pi / 2)
        self.cropPickerView.rotate(angle: angle)
    }
    
    // 이미지뷰에 회전을 적용한 이미지를 UIImage 변수에 저장하는 함수
    func saveRotatedImageFromImageView(imageView: UIImageView) -> UIImage? {
        guard let image = imageView.image else {
            return nil
        }

        // 현재 이미지뷰의 회전각을 가져옵니다.
        let currentRotationAngle = atan2(imageView.transform.b, imageView.transform.a)

        // 이미지뷰의 회전각을 제거한 이미지를 생성합니다.
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        let context = UIGraphicsGetCurrentContext()!

        // 이미지뷰의 회전각만큼 이미지를 회전시켜 그립니다.
        context.translateBy(x: image.size.width / 2, y: image.size.height / 2)
        context.rotate(by: currentRotationAngle)
        context.translateBy(x: -image.size.width / 2, y: -image.size.height / 2)

        image.draw(at: .zero)
        let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return rotatedImage
    }

}

// MARK: CropPickerViewDelegate
extension ViewController: CropPickerViewDelegate {
    func cropPickerView(_ cropPickerView: CropPickerView, result: CropResult) {

    }
}

// MARK: UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else { return }
        self.cropPickerView.image(image)
    }
}
