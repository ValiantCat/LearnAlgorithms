//
//  main.cpp
//  擦++
//
//  Created by nero on 16/4/13.
//  Copyright © 2016年 nero. All rights reserved.
//

#include <iostream>
//函数功能 ： 求一个字符串某个区间内字符的全排列
//函数参数 ： pStr为字符串，begin和end表示区间
//返回值 ：   无
using namespace std;
void Permutation_Solution1(char *pStr, int begin, int end)
{
    if(begin == end - 1) //只剩一个元素
    {
        for(int i = 0; i < end; i++) //打印
            cout<<pStr[i];
        cout<<endl;
    }
    else
    {
        for(int k = begin; k < end; k++)
        {
            swap(pStr[k], pStr[begin]); //交换两个字符
            Permutation_Solution1(pStr, begin + 1, end);
            swap(pStr[k],pStr[begin]);  //恢复
        }
    }
}
//提供的公共接口
void Permutation(char *pStr)
{
    Permutation_Solution1(pStr, 0, (int)strlen(pStr));
    //Permutation_Solution2(pStr,pStr);
}
int main(int argc, const char * argv[]) {
    // insert code here...
    char str[] = "ABC";
    
    Permutation(str);
    return 0;
}
