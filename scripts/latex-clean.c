#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

const int SIZE = 8;

void usage(){
    fprintf(stderr, "Usage:\n");
    fprintf(stderr, "-d,\t disable\n");
    fprintf(stderr, "-e,\t enable\n");
    fprintf(stderr, "-s,\t status\n");

    return;
}

int main(int argc, char **argv){
    system("sh -c \"latexmk -c\"");
    system("sh -c \"rm *.nav\"");
    system("sh -c \"rm *.snm\"");
    system("sh -c \"rm *.vrb\"");
    system("sh -c \"rm *.synctex*\"");
    system("sh -c \"rm *.synctex,gz\"");

    return 0;
}
