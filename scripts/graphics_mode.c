#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

int main(){

    printf("%d\n", system("envycontrol --query | cut -d \" \" -f 5"));

    return 0;
}
