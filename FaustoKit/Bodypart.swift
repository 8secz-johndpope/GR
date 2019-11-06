//
//  BodyPosition.swift
//  BodyDetection
//
//  Created by Vinicius Dilay on 29/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ARKit
import RealityKit

class BodyPart {

    func distance( joint1: simd_float4, joint2: simd_float4) -> Float{
        let x = powf((joint1.x - joint2.x),2)
        let y = powf((joint1.y - joint2.y),2)
        let z = powf((joint1.z - joint2.z),2)
        return sqrtf(x + y + z)
    }
    

    func vector( joint1: simd_float4, joint2: simd_float4) -> simd_float3{
        let vector : simd_float3 = [joint2.x - joint1.x, joint2.y - joint1.y, joint2.z - joint1.z]
    
        return vector
    }
    
    func angle( vector1: simd_float3, vector2: simd_float3) -> Float{
        let x = powf(vector1.x, 2) + powf(vector1.y, 2) + powf(vector1.z, 2)
        let y = powf(vector2.x, 2) + powf(vector2.y, 2) + powf(vector2.z, 2)
        let z = (vector1.x * vector2.x) + (vector1.y * vector2.y) + (vector1.z * vector2.z)
        let k = sqrtf(x) * sqrtf(y)
        
        return acosf(z/k)*360/(2*Float.pi)
    }
    
    func angle( vector1: simd_float4, vector2: simd_float4) -> Float{
        let x = powf(vector1.x, 2) + powf(vector1.y, 2) + powf(vector1.z, 2)
        let y = powf(vector2.x, 2) + powf(vector2.y, 2) + powf(vector2.z, 2)
        let z = (vector1.x * vector2.x) + (vector1.y * vector2.y) + (vector1.z * vector2.z)
        let k = sqrtf(x) * sqrtf(y)
        
        return acosf(z/k)*360/(2*Float.pi)
        
    }
}


extension BodyTrackedEntity {
    func jointName(forPath path: String) -> ARSkeleton.JointName {
        let splitPath = path.split(separator: "/")
        return ARSkeleton.JointName(rawValue: String(splitPath[splitPath.count - 1]))
    }
}
