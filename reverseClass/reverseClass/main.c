//
//  main.c
//  reverseClass
//
//  Created by 张旭洋 on 2023/5/8.
//

#include <stdio.h>

int n, m;

void bubble_Sort(int arr[n][m]);

int main(void) {
    char key;
    printf("   成绩分析系统\n");
    printf("[Y]进入   [N]退出\n");
    scanf("%c", &key);
    switch(key) {
        case'Y':break;
        case'N':return 0;
    }
    
    printf("输入学生数及科目数：");
    scanf("%d %d", &n, &m);
    int array[n][m];
    for (int i = 0; i < n; i++) {
        printf("第%d个同学的成绩:", i + 1);
        for (int j = 0; j < m; j++) scanf("%d", &array[i][j]);
        }
    putchar('\n');
    
    
    printf("以下为成绩分析及排名：\n\n");
    printf("  电分   大物   C语言    平均分\n\n");
    bubble_Sort(array);
    

    
    
    
    putchar('\n');putchar('\n');putchar('\n');
    return 0;
}

void bubble_Sort(int arr[n][m]) {
    
    for (int i = 0; i < n - 1; ++i) {
        
        for (int j = 0; j < n - i - 1; ++j) {
            double average_1 = 0, average_2 = 0;
            for (int k = 0; k < m; ++k) {
                average_1 += arr[j][k];
                average_2 += arr[j + 1][k];
            }
            average_1 /= m;
            average_2 /= m;
            
            if (average_1 < average_2) {
                for (int l = 0; l < m; l++){
                    int tmp = arr[j][l];
                    arr[j][l] = arr[j + 1][l];
                    arr[j + 1][l] = tmp;
                }
            }
        }
        
    }
    
    double aver = 0 ;
    for (int h = 0; h < n; ++h) {
        aver = 0;
        for (int z = 0; z < m; z++) {
            aver += arr[h][z];
            printf("%5d ", arr[h][z]);
        }
        aver /= m;
        printf("%10.2lf\n\n", aver);
    }
    
}















//存放的内层数组的长度是需要确定的，存放数组的数组和之前一样，可以根据后面的值决定
