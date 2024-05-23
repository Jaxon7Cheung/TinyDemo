//
//  main.c
//  testssssss
//
//  Created by 张旭洋 on 2023/6/8.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int x, y, z, l;
    for (x = 0; x < 10; ++x) {
        for (y = 0; y < 10; ++y) {
            for (z = 0; z < 10; ++z) {
                for (l = 0; l < 10; ++l) {
                    if (900 * x + 90 * y == 92 * z + 9 * l) {
                        printf("%d %d %d %d\n", x, y, z, l);
                    }
                }
            }
        }
    }
    return 0;
}
