#include <stdio.h>
#include <ctype.h>

int main(int argNum , char *args[]){
    if(argNum != 2){
        printf("incorrect usage.\n proper use: %s <file_name>", args[0]);
    }
    

    FILE* filePt = fopen(args[1],"rb");

    if (filePt == NULL){
        printf("File Failed To Open");
        return 0;
    }

    unsigned char buffer[16];
    size_t bytesRead;
    unsigned int localfileaddress = 0;

    while ((bytesRead = fread(buffer, 1, 16, filePt)) > 0)
    {   
        //propint the in file address
        printf("%08x ", localfileaddress);

        //print the bytes
        for (int i = 0; i < 16; i++) {
            if (i < bytesRead)
                printf("%02x ", buffer[i]);
            else
                printf("   "); // Padding
        }
        

        //print the ascii representations
        printf(" |");
        for (int i = 0; i < bytesRead; i++)
        {
            if (isprint(buffer[i]))
            {
                putchar(buffer[i]);
            }
            else
            {
                putchar('.');
            }
            
        }
        printf("|\n");

        //increment
        localfileaddress+= bytesRead;
    }
    
}