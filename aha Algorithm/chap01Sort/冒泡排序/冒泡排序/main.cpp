//
//  main.cpp
//  冒泡排序
//
//  Created by nero on 16/9/18.
//  Copyright © 2016年 nero. All rights reserved.
//

#include <iostream>
#include <vector>
int main(int argc, const char * argv[]) {
    std::vector<int> input{8,5,6,3,2};
    std::size_t size = input.size();
    for (int i = 1; i<size; i++) {
        for (int j = 1; j <= size-i; j++) {
            if (input[j] < input[j+1]) {
                int temp = input[j];
                input[j] = input[j+1];
                input[j+1] = temp;
            }
        }
    }
    std::copy(input.begin(), input.end(), std::ostream_iterator<int ,char >(std::cout , "--"));
     //时间复杂度O(N*)
    return 0;
}

/*
 for (int i = 1; i<size; i++) {
 for (std::size_t j = size-1; j > i; j--) {
 if (input[j] < input[j-1]) {
 int temp = input[j];
 input[j] = input[j-1];
 input[j-1] = temp;
 }
 }
 }
 */
