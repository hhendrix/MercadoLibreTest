//
//  ItemDetailViewController.swift
//  MercadoLibreTest
//
//  Created by Ibm Mac on 14/10/20.
//

import UIKit
import MapKit

class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var scrollImages: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var titleController: UILabel!
    
    @IBOutlet weak var scrollDetail: UIScrollView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var estateLabel: UILabel!
    @IBOutlet weak var garantyLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    
    @IBOutlet weak var ubicacionLabel: UILabel!
    
    
    @IBOutlet weak var ubicationMap: MKMapView!
    
    
    var idItemDetail :String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let itemDetailClass = ManagerServices()
        
        self.pageControl.numberOfPages = 0
        
        itemDetailClass.getDetailItem(idItem: self.idItemDetail) { (itemDetail) in
            if itemDetail != nil {
                DispatchQueue.main.async {
                    self.titleController.text = itemDetail!.title
                    self.loadImageController(dataController: itemDetail!)
                    self.loadtextDetail(dataController: itemDetail!)
                    self.locationProduct(dataController: itemDetail!)
                }
            }
        }
    }
    
    
    // MARK: - Event Controller
    
    @IBAction func btnClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Load Text Detail
    func loadtextDetail(dataController:ItemDetail){
        
        self.priceLabel.text = "$ \(dataController.price)"
        self.estateLabel.text = dataController.condition
        self.garantyLabel.text = dataController.warranty
        self.healthLabel.text = "\(dataController.health)"
        
        let locationName = "\(dataController.seller_address.city.name ?? "") ,  \(dataController.seller_address.state.name ?? "")"
        
        self.ubicacionLabel.text = locationName
        
    }
    
    // MARK: - Set Location product
    func locationProduct(dataController:ItemDetail) {
        let latitude = CLLocationDegrees(dataController.geolocation.latitude)
        let longitude = CLLocationDegrees(dataController.geolocation.longitude)
        let center = CLLocation(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: center.coordinate, latitudinalMeters: 0, longitudinalMeters: 0)
        
        ubicationMap.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        
        let zRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 5000)
        ubicationMap.setCameraZoomRange(zRange, animated: true)
        
        let locationName = "\(dataController.seller_address.city.name ?? "") ,  \(dataController.seller_address.state.name ?? "")"
        
        let annnotation = AnnotationMap(title: "Ubicación", locationName: locationName, discipline:"\(dataController.seller_address.country.name ?? "")", coordinate: center.coordinate)
        
        ubicationMap.addAnnotation(annnotation)
        
    }
    
    
    // MARK: - load Images Scroll
    
    func loadImageController(dataController:ItemDetail) {
        var viewcOntroller = [UIView]()
        
        for image in dataController.pictures {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 2), height: 239.0))
            imageView.donwloadedFrom(url: image.secure_url, contentMode: .scaleToFill)
            viewcOntroller.append(imageView)
        }
        
        scrollImages.frame = CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width - 2), height: 239.0)
        scrollImages.contentSize = CGSize(width: (UIScreen.main.bounds.width - 2) * CGFloat(viewcOntroller.count), height: 239.0)
        scrollImages.isPagingEnabled = true
        
        for i in 0 ..< viewcOntroller.count {
            viewcOntroller[i].frame = CGRect(x: (UIScreen.main.bounds.width - 2) * CGFloat(i), y: 0, width: (UIScreen.main.bounds.width - 2), height: 239)
            scrollImages.addSubview(viewcOntroller[i])
        }
        
        scrollImages.delegate = self
        
        if viewcOntroller.count > 0 {
            pageControl.numberOfPages = viewcOntroller.count
            pageControl.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        
    }
    
    
    private func scrollToIndex(index: Int) {
        let pageWidth: CGFloat = scrollImages.frame.width
        let slideToX: CGFloat = CGFloat(index) * pageWidth
        
        scrollImages.scrollRectToVisible(CGRect(x: slideToX, y:0, width:pageWidth, height:scrollImages.frame.height), animated: true)
    }
    
    
    
    @IBAction func pageSelect(_ sender: UIPageControl) {
        
        self.scrollToIndex(index: sender.currentPage)
    }
    
}


extension ItemDetailViewController : UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        pageControl.currentPage = Int(currentPage)
    }
}





