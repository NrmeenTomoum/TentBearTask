//
//  HomeModels.swift
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





enum Home
{
  // MARK: Use cases
  
  enum Users
  {
//    struct Request
//    {
//    }
    struct UsersResponseInfo: Codable {
        var page: Int?
        var  per_page: Int?
        var     total: Int?
        var total_pages: Int?
        var data: [Home.Users.Response]?
    }
    
    struct Response: Codable {
        var id: Int?
        var  email: String?
        var     first_name: String?
        var last_name: String?
        var avatar: String?
    }
    struct ViewModel
    {
    }
  }
}
