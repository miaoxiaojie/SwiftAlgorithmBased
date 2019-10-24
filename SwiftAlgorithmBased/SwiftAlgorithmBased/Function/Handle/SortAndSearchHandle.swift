//
//  SortAndSearchViewController.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/21.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit

let SortAndSearchTitle = "排序和搜索"

class SortAndSearchHandle:
    NSObject,
someOneAnswerProtocol {

    
    @objc func insertSortMobile() {//插入排序 通过移动
        
        //把数组 [61,5,33,44,22] 进行从小到大进行排序
        var list = [61,5,33,44,22]
        let result = p_insertSortMobile(array: &list)
        print("排序后的结果\(result)")
        
    }
    
    @objc func insertSortExchange() {//插入排序，通过交换
        
        var list = [61,5,33,44,22]
        let result = p_insertSortExchange(array: &list)
        print("排序后的结果\(result)")
    }
    
    @objc func bubbleSort() {
        var list = [61,5,33,44,22]
        let result = p_bubbleSort(array: &list)
        print("冒泡排序后的结果\(result)")
    }
    
    @objc func selectSort() {
        var list = [61,5,33,44,22]
        let result = p_selectSort(array: &list)
        print("选择排序后的结果\(result)")
    }
    
    @objc func quickSort()
    {
        var sortArray = [49, 38, 65, 97, 76, 13, 27, 49, 55, 04]
        let result = p_quickSort(array: &sortArray, low: 0, high: sortArray.count-1)
        print("快速排序后的结果\(result)")
    }
    
    @objc func binarySearch()
    {
        //在数组中查找是否包含27
        let binarySearchArray = [4, 13, 38, 49, 55, 65, 76, 97]
        let result = p_binarySearch(nums: binarySearchArray, target: 27)
        print(result)
    }
    
    @objc func merge()
    {
        /*
         例子[[1,3],[5,6],[4,7],[2,3]]
         
         [1,3] + [2,3] = [1,3]
         [5,6] + [4,7] = [4,7]
         结果 [1,3] [1,3]
         */
        
        let one = MeetngTime.init(start: 1, end: 3)
        let two = MeetngTime.init(start: 5, end: 6);
        let there = MeetngTime.init(start: 4, end: 7)
        let four = MeetngTime.init(start: 2, end: 3)
        
        let meetingTimes = [one,two,there,four]
        let result = p_merge(meetingTimes: meetingTimes)
        print("合并后的会议\(result)")
        
    }
    
    /*
     
     步骤如下：
     * 从第一个元素开始，该元素可以认为已经被排序
     * 取出下一个元素，在已经排序的元素序列中从后向前扫描
     * 如果该元素（已排序）大于新元素，将该元素移到下一位置
     * 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置
     * 将新元素插入到该位置后
     * 重复步骤2~5
     */
    
    func p_insertSortMobile(array: inout [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        for i in 0..<(array.count - 1) {
            if array[i + 1] < array[i] {//小于有序区最大的数值，需要插入有序系列
                let temp = array[i + 1] //保存将要被有序区向后移顶替的值(即本轮插进有序区的值)
                
                var j = i + 1//有序区的序号
                repeat { //数据移动比 temp 大的都往后移
                    
                    j  -= 1
                    array[j + 1] = array[j]
                    
                    
                } while (j - 1 >= 0) && (array[j - 1] > temp) // 还需要移动
                
                // 插入
                array[j] = temp
                
            }
        }
        return array
    }
    
    
    func p_insertSortExchange(array: inout [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        
        for i in 1..<array.count {
            
            var y = i //从 i 往前栈。符合条件交换
            
            while y > 0 && array[y] < array [y - 1] {
                let temp = array[y]
                array[y] = array[y - 1]
                array[y - 1] = temp
                y -= 1
                
            }
            
        }
        return array
    }
    
    //冒泡排序
    func  p_bubbleSort(array:inout [Int]) -> [Int] {
        
        guard array.count > 1 else {
            return array
        }
        for i in 0..<(array.count - 1) {//外层循环为 数组长度 - 1
            
            for j in 0..<(array.count - 1 - i) {// 内层循环为 外层循环 - i
                
                if array[j] > array[j + 1] {// 冒泡操作
                    
                    array.swapAt(j, j + 1)
                    
                }
            
            }
        
        }
        return array
    }
    
    /*
     每一次从待排序的数据元素中选出最小(或最大)的一个元素，
     存放在系列的起始位置，然后，在从剩余末排序元素中继续寻
     找最小(或最大)的一个元素。然后放到已排序序列的末尾，依次
     类推，直到全部待排序的数据元素排完。选择排序是最不稳定的排序
     
     */
    
    func p_selectSort(array: inout [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        
        for i in 0..<(array.count - 1) {
            var min = i // 有序区的最后一个位置
            
            for j in (i + 1)...(array.count - 1) {//注意边界,是遍历到最后一个
                
                if array[min] > array[j] {
                    min = j;
                }
                
            }
            
            if i != min { //防止相同位置交换操作
                array.swapAt(min, i)
            }
        }
        return array
    }
    
    // 快速排序
    func p_quickSort(array: inout [Int], low: Int ,high: Int) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        
        if low < high { // 长度大于1
            
            let pivot = partiton(array: &array, low: low, high: high)
            p_quickSort(array: &array, low: low, high: pivot - 1)// 对枢轴之前的子序列递归快排
            p_quickSort(array: &array, low: pivot + 1, high: high)// 对枢轴之后的子序列递归快排
            
        }
        return array
    }
    
    //进行一次划分，并返回枢轴的最终位置
    func partiton(array: inout [Int] , low: Int, high: Int) -> Int {
        var left = low, right = high // 设置左右起点
        let x = array[low]//设置枢轴
        repeat {//left 和 right 从待排序的两端交替的向中间移动
            
            while (array[right] > x) && (left < right) {//从左往右栈，找出比枢轴小的数
                right -= 1
            }
            
            while (array[left] <= x) && (left < right) { // 从左往左找, 找出比枢轴大的数
                
                left += 1
            }
            
            if left < right {
                array.swapAt(left, right) //交换操作
            }
        } while left < right
        
        // 枢轴移到正确位置
        if low != right { // 防止交换位置相同
            array.swapAt(low, right) // 将枢轴和左边有序区的的最后一个数交换,此时为right的位置
        }
        
        return left // 返回枢轴的最终位置
        
    }
    
    //二分搜索
    //假设nums是一个升序数组
    func  p_binarySearch(nums: [Int], target: Int) -> Bool {
        var left = 0, mid = 0, right = nums.count - 1
        
        while left <= right {
            mid = (right - left) / 2 + left
            if nums[mid] == target {
                return true
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return false
    }
    /*
     例如有一个会议的时间为下午3点到5点，另一个会议的时间为下午4点到6点，那么合并之后的会议时间为下午3点到6点
     
     */
    
    func p_merge(meetingTimes: [MeetngTime]) -> [MeetngTime] {
        //处理特殊情况
        guard meetingTimes.count > 1 else {
            return meetingTimes
        }
         //按开始的时间进行排序
        var times = meetingTimes.sorted { (s0:MeetngTime,s1:MeetngTime) -> Bool in
            
            if s0.start != s1.start {
                return s0.start < s1.start
            }else{
                return s0.end < s1.end
            }
        }
        
        //新建结果数组
        var res = [MeetngTime]()
        res.append(times[0])
        
        //遍历排序后的原数组，并与结果数组归并
        for i in 1..<times.count {
            let last = res[res.count - 1]
            let current = times[i]
            if current.start > last.end
            {
                res.append(current)
            }
            else
            {
               last.end = max(last.end, current.end)
            }
        
        }
        return res
    }

    // MARK: - AnswerProtocol
    func getViewController() -> NSObject {
        return self
    }
    
    func getViewControllerTitle() -> String {
        return SortAndSearchTitle
    }
    
    func getAllData() -> [String : AnyObject]  {
        
        let dict =
            
            [
                "answer":AlgorithmBasedFactory.init().getClassName(classObject: SortAndSearchHandle.self),
                "problem":[
                    ["title":"直接插入排序(通过移动)","selName":"insertSortMobile"],
                    ["title":"插入排序(交换)","selName":"insertSortExchange"],
                    ["title":"冒泡排序","selName":"bubbleSort"],
                    ["title":"选择排序","selName":"selectSort"],
                    ["title":"快速排序","selName":"quickSort"],
                    ["title":"二分搜索","selName":"binarySearch"],
                    ["title":"已知很多会议，如果这些会议时间有重叠，则将它们合并","selName":"merge"],
                ]
                ] as [String : Any]
        
        
        return dict as [String : AnyObject]
    }
    

}

