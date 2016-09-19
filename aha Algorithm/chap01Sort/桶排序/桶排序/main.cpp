//
//  main.cpp
//  桶排序
//
//  Created by nero on 16/9/18.
//  Copyright © 2016年 nero. All rights reserved.
//

#include <iostream>
#include <vector>
int main(int argc, const char * argv[]) {
    /*
    　　这个算法就好比有11个桶，编号从0~10。每出现一个数，就将对应编号的桶中的放一个小旗子，最后只要数数每个桶中有几个小旗子就OK了。例如2号桶中有1个小旗子，表示2出现了一次；3号桶中有1个小旗子，表示3出现了一次；5号桶中有2个小旗子，表示5出现了两次；8号桶中有1个小旗子，表示8出现了一次
     */
    std::vector<int> input {5,3,5,2,8}; // 输入数据
    std::vector<int> allCanValue(11,0); //所有可能的取值
    for (int i = 0; i < input.size(); i++) {
        allCanValue[input[i]]++; // 桶中记录出现的次数
    }
    
    
    for (int i = 0; i < 11; i++) {
        for (int j = 1; j <=allCanValue[i]; j++ ) {
            std::cout << i;
        }
    }
    // 时间复杂度 为O(N)
    // 空间复杂度较大
    
    return 0;
}
