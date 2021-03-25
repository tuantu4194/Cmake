#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define newline printf("\n")
int special_case(int x){
    if (x >= -1 && x <= 1){
        printf("Got result: %d\n", x);
        return 1;
    }

    return 0;
}

int check_input_arg (int argc, char* argv[]){
    if (argc != 2){
        printf ("Need only 1 argument,it's number \n");
        return 1;
    }

    char* arg = argv[1];
    int i = 0;
    while (arg[i]!='\0'){
        if (!( (arg[i]>='0' && arg[i]<='9') || (arg[i]=='-' && i==0)))
        {
            printf ("This is not a number!!!\n");
            return 1;
        }
        i++;
    }

    if (arg[0]=='-') {i--;} // if it's minus number

    if (i > 9){
        printf ("The number is too large!!!\n");
        return 1;
    }

    return 0;
}

typedef void (*callback)(int);
extern int factorize(int num, callback cb);

void process_results(int x){
    printf("%d ", x);
}

int main(int argc, char* argv[]){
    if (check_input_arg(argc, argv)){
        return 1;
    }

    int num = atoi(argv[1]); // convert arr to int

    if (special_case(num)){
        return 0;
    }

    if (num < 0){
        printf("Result: -1 ");
        num = abs(num);
    }
    else {printf("Result: ");}

    int ret_asm = factorize(num, process_results);
    newline;
    return ret_asm;
}
