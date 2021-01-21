#include <stdio.h>
#include <stdlib.h> //exit smaa cls
#include <string.h> 
#include <conio.h> //
#include <time.h> 
#include <ctype.h> //karakter

void Header();
void Garis(int line);
void Double(int line);
void Menu();
void DataPelanggan();
void InputData();
void barangluar();
void barangdalam();
void CetakStruck();
void TabelRincian();

int HtD(int berat, int jarak, int jenis);
int HtL(int berat, int kota, int jenis);
int tmp=0;
char tombol;

int main() {
	
    char kata1[20], kata2[20], pass1[20], pass2[20];
    int cek1, cek2, a=4;
    Header();

    ulang: 
		strcpy(kata1,"Kelompok");
		printf("\n\n\t");
		Garis(24);
        printf("\n\tSILAHKAN LOGIN AKUN ANDA\n");
        printf("\t  KESEMPATAN LOGIN (%d)\n\t", a-1);
        Garis(24);
        printf("\n\n |Masukkan Username : ",kata1);
        gets(pass1); 
        strcpy(kata2,"7"); 
        printf(" |Masukkan Password : "); 
        gets(pass2);
 
        cek1=strcmp(kata1,pass1);
        cek2=strcmp(kata2,pass2); 

    if ((cek1 == 0)&&(cek2 == 0)){
    	system("cls");
    	Header();
    	printf("\n\n\t==Password Anda Benar==");
        strcat(kata1,kata2); //gabung str 1 dengan str 2
        printf("\n\t    Selamat Datang \n\t      %s\n\n",kata1);
        printf(" Tekan tombol [ENTER] untuk ke Menu");
        getch();
        system("cls");
        Menu(); 					//461
    }else {
    	system("cls");
    	Header();
		a=a-1;
        if(a>1 && a<4){
            printf("\n\t --Password Anda Salah--");
            goto ulang;
        }else{
            printf("\n\t   --Akses Ditolak!--\n"); 
            getch();
        }
    }
}

void Header(){
	Double(40);
    printf("\n\t ***SELAMAT DATANG***");
    printf("\n      PROGRAM EKSPEDISI JAYAKARSA");
    printf("\n    'Siaga Mengantarkan Kebahagiaan'");
    printf("\n\t  Jakarta, Indonesia\n");
    time_t ambil_waktu;
	time(&ambil_waktu);
	printf("       %s", ctime (&ambil_waktu));
    Double(40);
}

void Garis(int line) {
	int i;
	for(i = 0; i < line; i++) {
		printf("-");}
}

void Double(int line) {
	int i;
	for(i = 0; i < line; i++) {
		printf("=");}
}

struct Data{
    char  nama[20], Alamat[30], NoTelp[15], Kota[10];
    int berat, jarak;
} pengirim, penerima, barang, barang1,barang2;

struct Trans{
    char  jenis[30], Kdkota[10], Resi[20];
    int total;
} transaksi;
 
void DataPelanggan(){
	
	system("cls");
	
	Pelanggan:
		Double(30);
		printf ("\n   Isi Informasi Pelanggan\n");
		//DATA PENGIRIM 
		Garis(30);
    	printf("\n=    *** DATA PENGIRIM ***   =\n");
    	printf("= Nama\t : "); 		scanf(" %[^\n]",pengirim.nama);       
   		printf("= No.Telp: "); 		scanf(" %[^\n]",pengirim.NoTelp);
    	printf("= Alamat : "); 		scanf(" %[^\n]",pengirim.Alamat);
   		printf("= Kota\t : "); 		scanf(" %[^\n]",pengirim.Kota);
    	time_t ambil_waktu;
		time(&ambil_waktu);
		printf("= Tanggal: %s", ctime (&ambil_waktu));		
		//DATA PENERIMA    
    	Garis(30);
    	printf("\n=    *** DATA PENERIMA ***   =\n");
    	printf("= Nama\t : ");		scanf(" %[^\n]",penerima.nama);
    	printf("= No.Telp: "); 	scanf(" %[^\n]",penerima.NoTelp);
    	printf("= Alamat : ");		scanf(" %[^\n]",penerima.Alamat);
    	printf("= Kota\t : "); 		scanf(" %[^\n]",penerima.Kota);
    	Garis(30);
        
    //pengecekan data
    printf("\n");
    CheckData:
    	printf("Data yang dimasukan benar?[y/n] :");
		scanf(" %[^\n]", &tombol);
		if(tombol == 'y'){
    		FILE *pgln = fopen("Pelanggan.txt","w");
            fprintf(pgln,"%s;%s;%s;%s\n", pengirim.nama, pengirim.NoTelp, pengirim.Alamat, pengirim.Kota);
            fprintf(pgln,"%s;%s;%s;%s\n", penerima.nama, penerima.NoTelp, penerima.Alamat, penerima.Kota);
            fclose(pgln);
    	}else{
			if(tombol == 'n'){
    			system("cls");
    			goto Pelanggan;
    		}else{
    			goto CheckData;
			}
		}
}

int HtD(int berat, int jarak, int jenis){

	int htberat1, htjarak1,  hatot;
   
	//Hitung Harga Ongkir Berat
	if(berat<=10)				{htberat1 = berat * 5000;}
	if(berat<=15 && berat>10)	{htberat1 = berat * 10000;}
	if(berat<=20 && berat>15)	{htberat1 = berat * 25000;}
	if(berat>20)				{htberat1 = berat * 30000;}
   
	//Hitung Harga Ongkir Jarak
	if(jarak<=10)				{htjarak1 = jarak * 5000;}
	if(jarak<=15 && jarak>10)	{htjarak1 = jarak * 10000;}
	if(jarak<=20 && jarak>15)	{htjarak1 = jarak * 25000;}
	if(jarak>20)				{htjarak1 = jarak * 30000;}

	//Penentuan Jenis Pengiriman
  	if (jenis==1)	{hatot = htberat1 + htjarak1;}
   	else 			{hatot = 2*(htberat1 + htjarak1);}
   	
	//printf("%d ; ", hatot); //Opsi Lain
	return hatot;
} 

void barangdalam(){
 
	system("cls");
	struct tm *waktu;
    time_t Tval;
    Tval = time(NULL);
    waktu = localtime(&Tval);
	
	BarangDlm:
		Double(30);
    	printf ("\n   Isi Informasi Barang\n"); 
    	Garis(30);
    	printf("\n= Nama Barang\t : ");	scanf(" %[^\n]",barang1.nama);
    	printf("= Berat (kg)\t : ");		scanf("%d",&barang1.berat);
    	printf("= Jarak (km)\t : ");		scanf("%d",&barang1.jarak);
    
    printf("\n");
    Kota:
    	if(tmp==0)	{strcpy(transaksi.Kdkota,"JKT");}
    
    //Pemilihan Jenis Pengiriman
    int jenis;
    Jenis:
 		Double(30);
    	printf("\n= Pilih Jenis Pengiriman\n");
    	Garis(30);
    	printf("\n= 1. Reguler");
    	printf("\n= 2. Express\n");
    	Double(20);
    	printf("\n= Pilihan anda: ");
    	scanf("%d", &jenis);
    
    switch(jenis){
		case 1 : strcpy(transaksi.jenis, "Reguler"); break;
		case 2 : strcpy(transaksi.jenis, "Express"); break;
		default: 
			Garis(20);
			printf("\n Anda salah memasukan pilihan\n Klik [ENTER] ");  
			getch();
			system("cls");	
			goto Jenis;
 	}
    
    printf("\n");
    
    CheckData: 
    	printf(" Data yang dimasukan benar?[y/n] :");
    	scanf(" %[^\n]", &tombol);
        if(tombol == 'y'){
			transaksi.total = HtD(barang1.berat, barang1.jarak, jenis);
            FILE *brg=fopen("Barang.txt","w");
            fprintf(brg,"%s;%d;%d\n",barang1.nama, barang1.berat, barang1.jarak);
            fprintf(brg,"%s;%d;%s%d%d%d\n",transaksi.jenis, transaksi.total, transaksi.Kdkota, waktu->tm_mday, waktu->tm_mon+1, waktu->tm_year);
            fclose(brg);
            
			printf(" Tekan [ENTER] untuk Cetak Struck "); getch();
			CetakStruck();
        }else 
			if(tombol == 'n'){
            	system("cls");
            	goto BarangDlm;
        	}else{
            	goto CheckData;
        	}    
} 

int HtL(int berat, int kota, int jenis){
	
	int htberat2, htkota,hatot;

	//Hitung Harga Ongkir Berat
	if(berat<=10)				{htberat2 = berat * 5000;}
	if(berat<=15 && berat>10)	{htberat2 = berat * 10000;}
	if(berat<=20 && berat>15)	{htberat2 = berat * 25000;}
	if(berat>20)				{htberat2 = berat * 30000;}
   
	//Hitung Harga Kota Pilihan
	switch(kota){ 
        case 1: htkota = 25000; break;
        case 2: htkota = 35000; break;
        case 3: htkota = 45000; break;
        case 4: htkota = 55000; break;
        default:
            printf("Anda salah memasukan pilihan\n"); 
      		barangluar();}
	
	//Hitung Jenis Pengiriman
  	if (jenis==1)	{hatot = htberat2 + htkota;}
   	else 			{hatot = 2*(htberat2 + htkota);}
 
	return hatot;
}

void barangluar(){
	
	system("cls");
	struct tm *waktu;
    time_t Tval;
    Tval = time(NULL);
    waktu = localtime(&Tval);
	
	BarangLr:
    	Double(30);
    	printf ("\n   Isi Informasi Barang\n"); 
    	Garis(30);
    	printf("\n= Nama Barang\t : ");	scanf(" %[^\n]",barang2.nama);
    	printf("= Berat (kg)\t : ");		scanf("%d",&barang2.berat);
    
    printf("\n");
    
    //Pemilihan Kota Tujuan
    int kota;
    PilihKota:
 		Double(30);
    	printf("\n= Pilih Kota Tujuan\n");
    	Garis(30);
    	printf("\n= 1. Bogor");
    	printf("\n= 2. Depok");
    	printf("\n= 3. Tanggerang");
    	printf("\n= 4. Bekasi\n");
    	Double(20);
    	printf("\n Pilihan anda: ");
    	scanf("%d", &kota);
    
    switch(kota){ 
        case 1: strcpy(transaksi.Kdkota,"BGR"); break;
        case 2: strcpy(transaksi.Kdkota,"DPK"); break;
        case 3: strcpy(transaksi.Kdkota,"TGR"); break;
        case 4: strcpy(transaksi.Kdkota,"BKS"); break;
        default:
            Garis(20);
			printf("\n Anda salah memasukan pilihan\n Klik [ENTER] ");  
			getch();
			system("cls");
            goto PilihKota;
    }
    
    printf("\n");
    
    //Pemilihan Jenis Pengiriman
    int jenis;
    Jenis:
 		Double(30);
    	printf("\nPilih Jenis Pengiriman\n");
    	Garis(30);
    	printf("\n-1. Reguler");
    	printf("\n-2. Express\n");
    	Double(20);
    	printf("\n-Pilihan anda: ");
    	scanf("%d", &jenis);
    
    switch(jenis){
    	case 1 : strcpy(transaksi.jenis, "Reguler"); break;
    	case 2 : strcpy(transaksi.jenis, "Express"); break;
    	default:
            Garis(20);
			printf("\n Anda salah memasukan pilihan\n Klik [ENTER] "); 
			getch();
			system("cls");
            goto Jenis;
 	}
    
    printf("\n");
    
    CheckData:
    	printf(" Data yang dimasukan benar?[y/n] :");
    	scanf(" %[^\n]", &tombol);
    	if(tombol == 'y'){
    		transaksi.total = HtL(barang2.berat, kota, jenis);
        	FILE *brg=fopen("Barang.txt","w");
        	fprintf(brg,"%s;%d;\n",barang2.nama, barang2.berat);
        	fprintf(brg,"%s;%d;%s%d%d%d\n",transaksi.jenis, transaksi.total, transaksi.Kdkota, waktu->tm_mday, waktu->tm_mon+1, waktu->tm_year);
        	fclose(brg);
        
			printf(" Tekan ENTER untuk Cetak Struck "); getch();
        	CetakStruck();
    	}else 
			if(tombol == 'n'){
        		system("cls");
        		goto BarangLr;
        	}else{
            	goto CheckData;
        	}
}

void InputData(){
	
	system("cls");
    int pilih;
    Pilih:
    	Double(40);
    	printf ("\n\tPILIH DAERAH PENGIRIMAN\n");
    	Garis(40);
		printf ("\n= 1. Pengiriman Dalam Kota             =");
    	printf ("\n= 2. Pengiriman Luar Kota              =\n");
    	Double(40);
    	printf("\n Masukan Pilihan[1/2]: ");
    	scanf("%d",&pilih);
	
    switch(pilih){
        case 1 : DataPelanggan();	barangdalam();	break;
        case 2 : DataPelanggan();	barangluar();	break;
        default: 
        	printf("\n\t  --Pilihan Anda Salah--\n" 
			" Silahkan Klik [ENTER] untuk Mengulanginya");
        	getch();
        	system("cls");
        	goto Pilih;
	}
	
	CheckData:
        printf("\t   Ingin Transaksi lagi?[y/n] :");
        scanf(" %[^\n]", &tombol);
        if(tombol == 'y'){
        	system("cls");
        	goto Pilih;
		}else 
			if(tombol == 'n'){
				system("cls");
				Menu();
			}else {
				goto CheckData;
			}
}

void TabelRincian(){
    FILE *brg = fopen("Barang.txt", "r");
        while(!feof(brg)){
		    fscanf(brg,"%[^;];%d;%d\n", barang.nama, &barang.berat, &barang.jarak);
		    fscanf(brg,"%[^;];%d;%[^\n]\n", transaksi.jenis, &transaksi.total, &transaksi.Resi);
		    
		    Double(49);
            printf("\n|\tJAYAKARSA\t |\t%s\t|\n",transaksi.Resi);
            Double(49);
            printf("\n|%11s\t|      Cash\t|   Rp.%d\t|\n",transaksi.jenis, transaksi.total);
		
        FILE *pgln = fopen("pelanggan.txt", "r");
		    while(!feof(pgln)){
		        fscanf(pgln,"%[^;];%[^;];%[^;];%[^\n]\n",pengirim.nama, pengirim.NoTelp, pengirim.Alamat, pengirim.Kota);
		        fscanf(pgln,"%[^;];%[^;];%[^;];%[^\n]\n",penerima.nama, penerima.NoTelp, penerima.Alamat, penerima.Kota);

		        Double(49);
	        	printf("\n|Pengirim:\t\t |Dari:\t\t\t|");
		        printf("\n|%10s\t\t | %10s\t\t|",pengirim.nama, pengirim.Alamat);
		        printf("\n|Telp. %s\t\t | %10s\t\t|\n",pengirim.NoTelp, pengirim.Kota);
		        Garis(49);	
		        printf("\n|Penerima:\t\t |Tujuan:\t\t|");
		        printf("\n|%10s\t\t | %10s\t\t|",penerima.nama, penerima.Alamat);
		        printf("\n|Telp. %s\t\t | %10s\t\t|\n",penerima.NoTelp, penerima.Kota);  
				  
	        }fclose(pgln);
	    
		    Double(49);
		    printf("\n|Scan\t         |Produk\t|Berat\t\t|");
		    printf("\n|      *.*.*     |%10s\t|%8d\t|", barang.nama, barang.berat);
		    printf("\n|      .*.*.     |\t        |\tkg\t|\n");
		    Double(49);
		
	   }fclose(brg);
	   
}

void CetakStruck(){
    time_t ambil_waktu;
    time(&ambil_waktu);
    
	if(transaksi.total == 0) {
		printf("\n\t");
		Garis(24);
		printf("\n\t--Belum ada Transaksi--\n"  
		"-Silahkan Mengisi Data terlebih dahulu-\n"
		"\t     Klik [ENTER]"); 
		getch();
		Menu();
	} else {
        system("cls");
        printf("\n\t    PROGRAM EKSPEDISI JAYAKARSA");
        printf("\n\t   Siaga Mengantarkan Kebahagiaan");
        printf("\n\t\tJakarta, Indonesia");
        printf("\n\t    %s\n", ctime (&ambil_waktu));
	 
        TabelRincian();
        printf("\n\n\t\t  Terima Kasih\n");
    }
}

void Menu(){
 
	system("cls");
    int pilihan;
	Options:
        Double(20);
        printf("\n     MENU UTAMA");
        printf("\n PROGRAM EKSPEDISI\n");
        Garis(20);
        printf("\n= 1. Input Data    =");
        printf("\n= 2. Cetak Struk   =");
        printf("\n= 3. Keluar        =\n");
        Double(20);
        
        printf("\n= Masukan Pilihan[1-4]: ");
        scanf("%d", &pilihan);
        switch(pilihan){ 
            case 1:
                InputData();
       			getch();
                break;
            case 2:
				CetakStruck();
				getch();
				system("cls");
                goto Options;
                break;
            case 3:
                system ("cls");
                Header();
                printf("\n\n\t    **Terima Kasih**\n"
				"     telah menggunakan layanan ini :)\n");
                exit(0);
                break;
            default:
                printf("\n  --Anda salah memasukan pilihan--\n"
				"   Klik [ENTER] untuk melanjutkan"); 
				getch();
				system ("cls");
                goto Options;
		}
}

