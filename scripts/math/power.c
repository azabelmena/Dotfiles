#include<stdio.h>

typedef long long Long;

Long power(Long x, Long n){
    if(!n){ // if n == 0.
        return 1;
    }
    if(n == 1){
        return x;
    }

    return x*power(x,n-1);
}

int main(int argc, char **argv){

    if(argc == 2 && (argv[1] == "--help" || argv[1] == "-h")){
        printf("Usage: div <arg1> <arg2>\n");

        return 0;
    }

    if(argc != 3){ // if there are less than 3 arguments.

        // print error messege.
        fprintf(stderr, "Usage: div <arg1> <arg2>\n");
        fprintf(stderr, "div accepts exactly 2 arguments.\n");

        return 2; // return error.
    }

    // declare long long ints to store possibly large values.
    Long x;
    Long n;

    sscanf(argv[1], "%lld", &x); // store arg 1 in a.
    sscanf(argv[2], "%lld", &n); // store arg 2 in b.

    Long pow = power(x, n);

    printf("%lld^%lld = %lld\n", x, n, pow);

    return 0;
}
