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

    if(argc != 2){
        usage();

        return 2;
    }

    char opt;
    char *status = "disabled";
    /*int stat = system("cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode");*/

    while((opt = getopt(argc, argv, "desh")) != EOF){
        switch(opt){
            case 'd':
                system("sudo sh -c \"echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode\"");
                fprintf(stdout, "Conservation mode disabled.\n");

                break;

            case 'e':
                system("sudo sh -c \"echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode\"");
                fprintf(stdout, "Conservation mode enabled.\n");

                break;

            case 's':
                if(system("cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode")){
                    status = "enabled";
                }

                fprintf(stdout, "Conservation mode is %s.\n", status);
                break;

            case 'h':
                usage();

                return 0;

            default:
                usage();

                return 2;
        }
    }

    argc -= optind;
    argv += optind;

    return 0;
}
