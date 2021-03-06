//
//  HomePresenter.swift
//  TentBearTask
//
//
//  Created by Nrmeen Tomoum on 09/01/2020.
//  Copyright © 2020 Nermeen. All rights reserved.
//


import UIKit

protocol HomePresentationLogic
{
       func stopLoader()
       func presentLoader()
       func presentAlertMessage(message : String)
       func presentListOfUsers(response: [Home.Users.Response])
       
}

class HomePresenter: HomePresentationLogic
{
  weak var viewController: HomeDisplayLogic?
  
  // MARK: Do something
  
  func presentListOfUsers(response: [Home.Users.Response])
  {
    viewController?.displayListOfUsers(viewModel: response)
  }
    func stopLoader() {
        viewController?.stopIndecator()
    }
    
    func presentLoader() {
    viewController?.displayIndecator()
    }
    func presentAlertMessage(message : String)
    {
        viewController?.createAlert(title: "", subTitle: message)
    }
}
