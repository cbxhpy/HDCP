//
//  HDHM04Service.swift
//  HDCP
//
//  Created by 徐琰璋 on 16/1/14.
//  Copyright © 2016年 batonsoft. All rights reserved.
//

import Foundation
import ObjectMapper

class HDHM04Service {

    /**
     菜谱分类
     
     - parameter successBlock: 成功
     - parameter failBlock:    失败
     */
    func doGetRequest_HDHM04_URL(tagid:Int,limit:Int,offset:Int,successBlock:(hm04Response:HDHM04Response)->Void,failBlock:(error:NSError)->Void){
    
        
        HDRequestManager.doPostRequest(["tagid":tagid,"keyword":"","limit":limit,"offset":offset], URL: Constants.HDHM04_URL) { (response) -> Void in
            
            if response.result.error == nil {
                
                /// JSON 转换成对象
                let response = Mapper<HDHM04Response>().map(response.result.value)
                /// 回调
                successBlock(hm04Response: response!)
                
            }else{
                
                failBlock(error: response.result.error!)
            }
        }
        
    }
    
}
