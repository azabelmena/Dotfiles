#include<stdio.h>
#include<stdlib.h>

int main(){

    printf("%d\n", system("xinput --list-props \"Synaptics TM3336-004\" | grep \"Device Enabled (156): 1\" 2>/dev/null"));

    /*if((system("xinput --list-props \"Synaptics TM3336-004\" | grep \"Device Enabled (189): 0\"")) |*/
    /*(system("xinput --list-props \"Synaptics TM3336-004\" | grep \"Device Enabled (156): 0\""))){*/
        /*system("xinput --enable \"Synaptics TM3336-004\"");*/
    /*}*/
    /*else{*/
        /*system("xinput --disable \"Synaptics TM3336-004\"");*/
    /*}*/

    return 0;
}
