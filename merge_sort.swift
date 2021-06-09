// Created on 09 Jun 2021 by richard.stewing@udo.edu
// Copyright Richard Stewing,09 Jun 2021
// Licensed under MIT, See toplevel LICENSE file.


func merge(a : [Int], b : [Int]) -> [Int] {
    var index_a = 0
    var index_b = 0
    var result : [Int] = []
    
    while(index_a < a.count && index_b < b.count) {
        if(a[index_a] < b[index_b]) {
            result.append(a[index_a])
            index_a += 1
        } else {
            result.append(b[index_b])
            index_b += 1
        }
    }

    while(index_a < a.count) {
        result.append(a[index_a])
        index_a += 1
    }

    while(index_b < b.count) {
        result.append(b[index_b])
        index_b += 1
    }


    return result
}

func split(input : [Int]) -> ([Int],[Int]) {
    var a : [Int] = []
    var b : [Int] = []
    for i in 0..<input.count {
        if(i % 2 == 0) {
            a.append(input[i])
        } else {
            b.append(input[i])
        }
    }
    return (a,b)
}

func sort(input : [Int]) -> [Int] {
    if(input.count == 0 || input.count == 1) {
        return input
    }

    let (a,b) = split(input:input)

    let a_s = sort(input:a)
    let b_s = sort(input:b)
    return merge(a:a_s, b:b_s)
}

let problemNumber = 100_000_000
var input : [Int] = Array(0...problemNumber)
input.reverse()

let r = sort(input:input)

print("Post sorting: ", r)

