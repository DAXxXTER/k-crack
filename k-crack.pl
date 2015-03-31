#!/usr/bin/perl
# daxXxter

# versi
$ver = "1.8"; 

#ini adalah tampilan update perdetiknya semakin cepat updatenya maka
#akan sedikit melambat seting standartnya 5 detik
$dbgtmr = "5";

if ($dbgtmr<=0){ die "\n\nAtur update dbgtmr ke 5 untuk setingan standarnya !\n\n";};
use Digest::MD5 qw(md5_hex);
use Time::HiRes qw(gettimeofday);

if ($ARGV[0]=~"a") {
 $alpha = "abcdefghijklmnopqrstuvwxyz";}
if ($ARGV[0]=~"A") {
 $alpha = $alpha. "ABCDEFGHIJKLMNOPQRSTUVWXYZ";}
if ($ARGV[0]=~"1") {
 $alpha = $alpha."1234567890";}
if ($ARGV[0]=~"s") {
 $alpha = $alpha. "`~!@#/%$^&*()_+=-}{}{\"|/:?'>.;<";}
if ($ARGV[0]=~"all") {
 $alpha = $alpha. "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890`~!@#%$^&*()_+=-}{}{\"|/:?'>.;<";}

if ($alpha eq "" or $ARGV[3] eq "") {banner();};
if (length($ARGV[3]) != 32) { die "\nMD5 anda salah atau periksa kembali kombinasi pilihan.!\n\n";};

print "\n\n* Pilihan yang di gunakan\n";
print "$alpha\n\n";
print "* MD5 yang akan di bruteforce\n";
print "$ARGV[3]\n\n";

for (my $t=$ARGV[1];$t<=$ARGV[2];$t++){
 crack ($t);
}

sub banner{
 print "\n ------------------------------------------- \n";
 print " | k-crack v $ver                          | trimakasih kepada tuhan yesus kristus \n";
 print " | Author by : rio suyanto                 |     karna memberikan saya hikmat \n";
 print " | email     : rio_suyanto00 @ yahoo.co.id |        kekuatan dan kesehatan \n";
 print " | blog      : rio-suyanto.blogspot.com    | \n";
 print " | facebook  : facebook.com/rio.suyanto    |      Semoga ini dapat membantu. \n";
 print " -------------------------------------------\n\n";
 print " BACA :\n";
 print "	k-crack berjalan di background \n";
 print "	jadi jangan mengira karna update intervalnya lambat\n"; 
 print "	akan menyebabkan kinerja lambat , itu salah...!!! \n\n";
 print "	dari hasil ujicoba saya dengan beberapa script lain \n";
 print "	dan hasilnya lebih cepat script yang saya buat\n";
 print "	saya melakukan ujicoba dengan beberapa script python dan hasilnya \n";
 print "	script saya lebih cepat \n";
 print "	saya melakukan ujicoba dengan beberapa tool GUI windows dan bahkan jauh \n";
 print "	berbeda dengan hasil ujicoba dengan script python \n";
 print "	silahkan di adu dengan tools anda.\n\n";

 print "Cara pake : \n";
 print "	perl k-crack.pl <pilihan> <jumlah awal> <jumlah akhir> <MD5>\n";
 print "	anda bisa kombinasikan setiap pilihan yang ada \n";
 print "	perl k-crack.pl a1 3 3 0cb930e7cc76fde99583db6e6b5f3c4a \n\n";
 print "Pilihan :  \n";
 print "	  a   = abcdefghijklmnopqrstuvwxyz \n";
 print "	  A   = ABCDEFGHIJKLMNOPQRSTUVWXYZ \n";
 print "	  1   = 1234567890 \n";
 print "	  s   = @#%$^&*()_+=-}{}{\"|/`~!:?'>.;< \n";
 print "	  all = ( a )+( A )+( 1 )+( s ) \n\n";
 die "K e l u a r . . . !\n";
}

sub crack{
 $CharSet = shift;
 @RawString = ();
 for (my $i =0;$i<$CharSet;$i++){ $RawString[i] = 0;}
 $Start = gettimeofday();
 do{
  for (my $i =0;$i<$CharSet;$i++){
   if ($RawString[$i] > length($alpha)-1){
    if ($i==$CharSet-1){
    print "\n\n$CharSet Karakter selesai.\n\n";
    $cnt=0;
    return false;
   }
   $RawString[$i+1]++;
   $RawString[$i]=0;
   }
  }
###################################################
   $ret = "";
   for (my $i =0;$i<$CharSet;$i++){ $ret = $ret . substr($alpha,$RawString[$i],1);}
   $hash = md5_hex($ret);
   $cnt++;
   $Stop = gettimeofday();
   if ($Stop-$Start>$dbgtmr){
    $cnt = int($cnt/$dbgtmr);
    print "$ret\n";
    $cnt=0;
    $Start = gettimeofday();
   }
   if ($ARGV[3] eq $hash){
	   
print "\n\nPassword berhasil di dapat \n";
die "$hash => $ret\n\n";
   }
###################################################
  #checkhash($CharSet)."\n";

  $RawString[0]++;
 }while($RawString[$CharSet-1]<length($alpha));
}
