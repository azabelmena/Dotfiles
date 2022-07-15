#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

int main(){

    if(!(system("optimus-manager --status 1>/dev/null"))){
        printf("%d\n", system("optimus-manager --status | cut -d \" \" -f 5 | head -3 | tail +3"));

        return 0;
    }

    printf("dGPU not detected\n");


    return 1;
}
