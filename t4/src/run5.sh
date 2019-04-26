javac br/ufsc/ine5431/praticaiv/cuif2bmp.java
javac br/ufsc/ine5431/praticaiv/bmp2cuif.java
java br.ufsc.ine5431.praticaiv.bmp2cuif -v 4 ../imgs/JazzMan.bmp ../imgs/JazzMan4.cuif
java br.ufsc.ine5431.praticaiv.cuif2bmp ../imgs/JazzMan4.cuif ../imgs/JazzMan4.bmp

java br.ufsc.ine5431.praticaiv.bmp2cuif -v 4 ../imgs/lena.bmp ../imgs/lena.cuif
java br.ufsc.ine5431.praticaiv.cuif2bmp ../imgs/lena.cuif ../imgs/lena1.bmp

echo "Comparando JazzMan.bmp com JazzMan4.bmp";
java br.ufsc.ine5431.praticaiv.PSNR ../imgs/JazzMan.bmp ../imgs/JazzMan4.bmp
echo ""
exit;
