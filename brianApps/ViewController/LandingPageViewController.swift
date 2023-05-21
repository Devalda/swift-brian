//
//  LandingPageViewController.swift
//  brianApps
//
//  Created by DEVALDA on 17/05/23.
//

import UIKit


class LandingPageViewController: UIViewController ,Coordinating , UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var coordinator: Coordinator?

    @IBOutlet weak var uiCollectionView: UICollectionView!
    @IBOutlet weak var masukButton: UIButton!
    @IBOutlet weak var daftarButton: UIButton!
    @IBOutlet weak var pageControll: UIPageControl!
    
    var currentCarousellPage = 0

    let carousellDatas = [
        (imageCell:"PageIntro-1", descACelldata :"Bayar Tagihan Lebih Mudah" ,descBCElldata:"Bayar apa aja jadi lebih praktis dan mudah dimana aja dengan i.saku",descCCelldata:"label1C"  ),
        (imageCell:"PageIntro-2", descACelldata :"Kirim Uang Tanpa Rekening" ,descBCElldata:"Nikmati kemudahan kirim uang melalui i.saku",descCCelldata:"label2C"  ),
        (imageCell:"PageIntro-3", descACelldata :"Banyak Promonya" ,descBCElldata:"Nikmati berbagai diskon & penawaran dari i.saku",descCCelldata:"label3C"  ),
        (imageCell:"PageIntro-4", descACelldata :"Ambil Uang Dimana Saja" ,descBCElldata:"Saldo i.saku bisa diambil di toko Indomaret, Indogrosir & ATM Bank yang bekerjasama",descCCelldata:"label4C"  )]

    let carousellViewID = "LandingPageCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibCell = UINib(nibName: carousellViewID, bundle: nil)
        uiCollectionView.register(nibCell, forCellWithReuseIdentifier: carousellViewID)
        uiCollectionView.dataSource = self
        uiCollectionView.delegate = self
        uiCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let layoutCarousell = UICollectionViewFlowLayout()
        layoutCarousell.scrollDirection = .horizontal
        uiCollectionView.setCollectionViewLayout(layoutCarousell, animated: true)
//
        masukButton.layer.cornerRadius = 20
        masukButton.layer.borderWidth = 1.5
        masukButton.layer.borderColor = UIColor(red: 65.0/255.0, green: 159.0/255.0, blue: 249.0/255.0, alpha: 1.0).cgColor
//
        daftarButton.layer.cornerRadius = 20
        daftarButton.layer.borderWidth = 1.5
        daftarButton.layer.borderColor = UIColor(red: 65.0/255.0, green: 159.0/255.0, blue: 249.0/255.0, alpha: 1.0).cgColor

        // Do any additional setup after loading the view.
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  carousellDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: uiCollectionView.frame.width , height: uiCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: carousellViewID , for: indexPath) as! LandingPageCollectionViewCell
        let carousell = carousellDatas[indexPath.row]
        
        cell.imgCell.image = UIImage(named: carousell.imageCell)
        cell.descACell.text = carousell.descACelldata
        cell.descBCell.text = carousell.descBCElldata
//        cell.descCCell.text = carousell.descACelldata
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentCarousellPage = Int(scrollView.contentOffset.x/width)
        pageControll.currentPage = currentCarousellPage
        
    }


    @IBAction func LoginAction(_ sender: Any) {
        let vc : UIViewController & Coordinating = LoginViewController()
        self.navigationController?.setViewControllers([vc], animated: true)
        
    }
    @IBAction func RegisterAction(_ sender: Any) {
        
    }


}


