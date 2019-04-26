javac br/ufsc/ine5431/praticaiv/cuif2bmp.java
javac br/ufsc/ine5431/praticaiv/bmp2cuif.java
java br.ufsc.ine5431.praticaiv.bmp2cuif -v 3 ../imgs/JazzMan.bmp ../imgs/JazzMan3.cuif
java br.ufsc.ine5431.praticaiv.cuif2bmp ../imgs/JazzMan3.cuif ../imgs/JazzMan3.bmp

echo "Comparando JazzMan.bmp com JazzMan3.bmp";
java br.ufsc.ine5431.praticaiv.PSNR ../imgs/JazzMan.bmp ../imgs/JazzMan3.bmp
echo "Comparando JazzMan2.bmp com JazzMan3.bmp";
java br.ufsc.ine5431.praticaiv.PSNR ../imgs/JazzMan2.bmp ../imgs/JazzMan3.bmp
echo ""
exit;
