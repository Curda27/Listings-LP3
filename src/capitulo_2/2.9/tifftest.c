#include <stdio.h>
#include <tiffio.h>

int main (int argc, char** argv)
{
    TIFF* tiff;
    tiff = TIFFOpen (argv[1], "r");
    if (tiff){
        printf("El archivo en la direccion %s se leyo correctamente\n",argv[1]);
        TIFFClose (tiff);
    }else{
        printf("No se pudo abrir el .tiff");
    }
   
    
    return 0;
}