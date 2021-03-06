//
//  TealiumDiskStorageConfig.swift
//  tealium-swift
//
//  Created by Craig Rouse on 28/06/2019.
//  Copyright © 2019 Tealium, Inc. All rights reserved.
//

import Foundation

public extension TealiumConfig {

    /// Sets the minimum free disk space on the device for Disk Storage to be enabled
    ///
    /// - Parameter spaceInMB: `Int` containing the minimum amount for free space in Megabytes (default 20MB)
    func setMinimumFreeDiskSpace(spaceInMB: Int32) {
        optionalData[TealiumKey.minimumFreeDiskSpace] = spaceInMB * 1_000_000
    }

    /// - Returns: `Int` containing the minimum free space in Megabytes allowed for Disk Storage to be enabled
    func getMinimumFreeDiskSpace() -> Int32? {
        minimumFreeDiskSpace
    }
    
    /// Sets the minimum free disk space in Megabytes  for Disk Storage to be enabled
    var minimumFreeDiskSpace: Int32? {
        get {
            optionalData[TealiumKey.minimumFreeDiskSpace] as? Int32
        }
        
        set {
            guard let newValue = newValue else {
                optionalData[TealiumKey.minimumFreeDiskSpace] = nil
                return
            }
            optionalData[TealiumKey.minimumFreeDiskSpace] = newValue * 1_000_000
        }
    }

    /// Enables (default) or disables disk storage.
    /// If disabled, only critical data will be saved, and UserDefaults will be used in place of disk storage￼.
    ///
    /// - Parameter isEnabled: `Bool` indicating if disk storage should be enabled (default) or disabled
    @available(*, deprecated, message: "Please switch to config.diskStorageEnabled")
    func setDiskStorageEnabled(isEnabled: Bool = true) {
        diskStorageEnabled = isEnabled
    }

    /// Checks whether Disk Storage is currently enabled
    ///￼
    /// - Returns:`Bool` indicating if disk storage is enabled (default) or disabled
    @available(*, deprecated, message: "Please switch to config.diskStorageEnabled")
    func isDiskStorageEnabled() -> Bool {
        diskStorageEnabled
    }
    
    /// Enables (default) or disables disk storage.
    /// If disabled, only critical data will be saved, and UserDefaults will be used in place of disk storage￼.
    var diskStorageEnabled: Bool {
        get {
            optionalData[TealiumKey.diskStorageEnabled] as? Bool ?? true
        }
        
        set {
            optionalData[TealiumKey.diskStorageEnabled] = newValue
        }
    }
    
    @available(*, deprecated, message: "Please switch to config.diskStorageDirectory")
    func setOverrideDiskStorageDirectory(_ directory: Disk.Directory) {
        diskStorageDirectory = directory
    }
    
    @available(*, deprecated, message: "Please switch to config.diskStorageDirectory")
    func getOverrideDiskStorageDirectory() -> Disk.Directory? {
        diskStorageDirectory
    }
    
    /// Sets the directory to be used for disk storage. Default `.caches`.
    var diskStorageDirectory: Disk.Directory? {
        get {
            optionalData[TealiumKey.diskStorageDirectory] as? Disk.Directory
        }
        
        set {
            optionalData[TealiumKey.diskStorageDirectory] = newValue
        }
    }

}
