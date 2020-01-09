//
//  DetailsViewController.swift
//  TentBearTask
//
//  Created by Nrmeen Tomoum on 09/01/2020.
//  Copyright (c) 2020 Nermeen. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SDWebImage
protocol DetailsDisplayLogic: class
{
    func displayUserInfo(viewModel: Home.Users.Response)
}

class DetailsViewController: UIViewController, DetailsDisplayLogic
{
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userInfo: UILabel!
    var interactor: DetailsBusinessLogic?
  var router: (NSObjectProtocol & DetailsRoutingLogic & DetailsDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = DetailsInteractor()
    let presenter = DetailsPresenter()
    let router = DetailsRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    getUserInfo()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func getUserInfo()
  {
     interactor?.getUserInfo()
  }
    
  
    func displayUserInfo(viewModel: Home.Users.Response)
  {
    userImage.sd_setImage(with: URL(string: viewModel.avatar!), placeholderImage: UIImage(named: "new logo.png"))
    userInfo.text = ("First Name :\(viewModel.first_name!)\n, Last Name \(viewModel.last_name!), \(viewModel.email!)")
  }
}
