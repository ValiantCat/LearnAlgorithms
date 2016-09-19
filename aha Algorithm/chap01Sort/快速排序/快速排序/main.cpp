#if 1
//
//  main.cpp
//  快速排序
//
//  Created by nero on 16/9/18.
//  Copyright © 2016年 nero. All rights reserved.
//

#include <iostream>
#include <vector>

void quickSort(int input[], int left,int   right) {
    if (left >right) {
        return; // 如果左边游标大于游标
    }
    int  i = left , j = right;
    int privot = input[left]; // 左侧为基准
    while (i != j ) { // 以基准划分
        while (input[j] >= privot &&  i < j ) {
            j--;
        }
        while (input[i] <= privot && i < j) {
            i++;
        }
        std::cout << "交换前" << input << std::endl;
        if ( i<j ) { // 交换
            int temp  = input[i];
            input[i] = input[j];
            input[j] = temp;
        }
        std::cout << "交换后" << input << std::endl;
    }
    //交换基准
    input[left] = input[i];
    input[i] = privot;
    std::cout << "交换基准后" << input << std::endl;
    quickSort(input, left, i-1);
    quickSort(input, i+1, right);
    
}

int main(int argc, const char * argv[]) {
    
    int input[] =  {6,1,2,7,9,3,4,5,10,8};
    quickSort(input, 0, 10);
    for (int v : input) {
        std::cout << v << "----";
    }
    return 0;
}

#endif


#include <stdio.h>
int a[101] =  {6,1,2,7,9,3,4,5,10,8};
int n = 10;//定义全局变量，这两个变量需要在子函数中使用
void quicksort1(int left,int right)
{
    int i,j,t,temp;
    if(left>right)
        return;
    
    temp=a[left]; //temp中存的就是基准数
    i=left;
    j=right;
    while(i!=j)
    {
        //顺序很重要，要先从右边开始找
        while(a[j]>=temp && i<j)
            j--;
        //再找右边的
        while(a[i]<=temp && i<j)
            i++;
        //交换两个数在数组中的位置
        if(i<j)
        {
            t=a[i];
            a[i]=a[j];
            a[j]=t;
        }
    }
    //最终将基准数归位
    a[left]=a[i];
    a[i]=temp;
    
    quicksort1(left,i-1);//继续处理左边的，这里是一个递归的过程
    quicksort1(i+1,right);//继续处理右边的 ，这里是一个递归的过程
}
int main1()
{
    int i,j,t;
    
    quicksort1(0,n); //快速排序调用
    
    //输出排序后的结果
    for(i=1;i<=n;i++)
        printf("%d ",a[i]);
    getchar();getchar();
    return 0;
}
