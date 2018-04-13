//: Playground - noun: a place where people can play

import UIKit

var a = [2,5,3,7]

// Bubble sorted
func bubbleSorted<T: Comparable>(_ array:inout [T]) {
    let n = array.count
    for i in 0..<n {
        for j in 0..<(n-i-1) {
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
            }
        }
    }
}

// Insertion Sort
func insertionSort<T: Comparable>(_ array:inout [T]) {
    guard array.count > 1 else { return }
    let n = array.count
    for i in 1..<n {
        let temp = array[i]
        var position = i
        while position >= 0 && array[position-1] > temp {
            array[position] = array[position-1]
            position -= 1
        }
        array[position] = temp
    }

}

// merfeSort
func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    return merge(leftArray, rightArray)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0

    var orderedArray: [T] = []

    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]

        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }

    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }

    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }

    return orderedArray
}


// quick sort
func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }

    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }

    return quicksort(less) + equal + quicksort(greater)
}
quicksort(a)
