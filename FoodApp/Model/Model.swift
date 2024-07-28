//
//  Model.swift
//  FoodApp
//
//  Created by Yevhen Kovalov on 28.07.2024.
//

import UIKit

struct  Model {

    func getIPAddress() -> String {
        var address: String = ""
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil

        // Retrieve the current interfaces - returns 0 on success
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                let interface = ptr!.pointee
                let addrFamily = interface.ifa_addr.pointee.sa_family

                // Check if interface is IPv4 and is not loopback
                if addrFamily == UInt8(AF_INET) {
                    if String(cString: interface.ifa_name) == "en0" {
                        // Convert interface address to a human readable string
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                    &hostname, socklen_t(hostname.count),
                                    nil, socklen_t(0), NI_NUMERICHOST)
                        address = String(cString: hostname)
                    }
                }
                ptr = interface.ifa_next
            }
            freeifaddrs(ifaddr)
        }

        return address
    }
}
