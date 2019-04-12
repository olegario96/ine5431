
import java.awt.image.*;
import java.net.*;
import javax.imageio.ImageIO;
import javax.swing.*;

/*
 * Gustavo Olegario
 * Rafael Pelle
 */

public class ImageApp {

	// Leitura da imagem
	public static BufferedImage loadImage(String surl) {
		BufferedImage bimg = null;
		try {
			URL url = new URL(surl);
			bimg = ImageIO.read(url);
			//bimg = ImageIO.read(new File("D:/Temp/mundo.jpg"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bimg;
	}

	public void apresentaImagem(JFrame frame, BufferedImage img) {
		frame.setBounds(0, 0, img.getWidth(), img.getHeight());
		JImagePanel panel = new JImagePanel(img, 0, 0);
		frame.add(panel);
		frame.setVisible(true);
	}

	public static BufferedImage criaImagemRGB() {
		BufferedImage img = new BufferedImage(200, 200, BufferedImage.TYPE_INT_RGB);

		WritableRaster raster = img.getRaster();

		for(int h=0;h<img.getHeight();h++) //Percorre a horizontal
			for(int w=0;w<img.getWidth();w++) {//Percorre a vertical
				raster.setSample(w,h,0,220); // Componente Vermelho
				raster.setSample(w,h,1,219); // Componente Verde
				raster.setSample(w,h,2,97);  // Componente Azul
			}
		return img;
	}

	public static BufferedImage criaImagemCinza() {
		BufferedImage img = new BufferedImage(256, 256, BufferedImage.TYPE_BYTE_GRAY);
		WritableRaster raster = img.getRaster();
		for(int h=0;h<img.getHeight();h++) //Percorre a horizontal
			for(int w=0;w<img.getWidth();w++) {//Percorre a vertical
				raster.setSample(w,h,0,h);//como o h = 0 e vai aumentando, cada linha vai ficando mais clara
			}
		return img;
	}

	public static BufferedImage criaImagemBinaria() {
		BufferedImage img = new BufferedImage(256, 256, BufferedImage.TYPE_BYTE_BINARY);
		WritableRaster raster = img.getRaster();
		for(int h=0;h<img.getHeight();h++) //Percorre a horizontal
			for(int w=0;w<img.getWidth();w++) {//Percorre a vertical
				if (((h/50)+(w/50)) % 2 == 0)
					raster.setSample(w,h,0,0); // checkerboard pattern.
				else raster.setSample(w,h,0,1);
			}
		return img;
	}

	// Imprime valores dos pixeis de imagem RGB
	public static void  imprimePixeis(BufferedImage bufferedImage) {
		for(int h=0;h<bufferedImage.getHeight();h++) //Percorre a horizontal
			for(int w=0;w<bufferedImage.getWidth();w++) {//Percorre a vertical
				int rgb = bufferedImage.getRGB(w,h);
				int r = (int)((rgb&0x00FF0000)>>>16); // componente vermelho
				int g = (int)((rgb&0x0000FF00)>>>8); // componente verde
				int b = (int)(rgb&0x000000FF); //componente azul
				System.out.print("at ("+w+","+h+"): ");
				System.out.println(r+","+g+","+b);
			}
	}

	public static BufferedImage reduceQuality(BufferedImage bufferedImage) {
		final int height = bufferedImage.getHeight() / 4;
		final int width = bufferedImage.getWidth() / 4;
		BufferedImage img = new BufferedImage(height, width, BufferedImage.TYPE_INT_RGB);
		WritableRaster raster = img.getRaster();

		for (int i = 0; i < bufferedImage.getHeight(); ++i) {
			for (int j = 0; j < bufferedImage.getWidth(); ++j) {
				if (i % 4 == 0 && j % 4 == 0) {
					final int x = j / 4;
					final int y = i / 4;
					int rgb = bufferedImage.getRGB(j, i);
					int r = (int)((rgb&0x00FF0000)>>>16);
					int g = (int)((rgb&0x0000FF00)>>>8);
					int b = (int)(rgb&0x000000FF);

					raster.setSample(x, y, 0, r); // Componente Vermelho
					raster.setSample(x, y, 1, g); // Componente Verde
					raster.setSample(x, y, 2, b);  // Componente Azul
				}
			}
		}

		return img;
	}

	public static BufferedImage shadesOfGrey(BufferedImage bufferedImage) {
		final int height = bufferedImage.getHeight();
		final int width = bufferedImage.getWidth();
		BufferedImage img = new BufferedImage(height, width, BufferedImage.TYPE_BYTE_GRAY);
		WritableRaster raster = img.getRaster();

		for (int i = 0; i < height; ++i) {
			for (int j = 0; j < width; ++j) {
				final int rgb = bufferedImage.getRGB(j, i);
				final int r = (int)((rgb&0x00FF0000)>>>16);
				final int g = (int)((rgb&0x0000FF00)>>>8);
				final int b = (int)(rgb&0x000000FF);

				final double greyShade = 0.3 * r + 0.59 * g + 0.11 * b;
				raster.setSample(j, i, 0, greyShade);
			}
		}

		return img;
	}

	public static BufferedImage binaryImage(BufferedImage bufferedImage) {
		final int height = bufferedImage.getHeight();
		final int width = bufferedImage.getWidth();
		BufferedImage img = new BufferedImage(height, width, BufferedImage.TYPE_BYTE_BINARY);
		WritableRaster raster = img.getRaster();

		for (int i = 0; i < height; ++i) {
			for (int j = 0; j < width; ++j) {
				final int rgb = bufferedImage.getRGB(j, i);
				final int r = (int)((rgb&0x00FF0000)>>>16);
				final int g = (int)((rgb&0x0000FF00)>>>8);
				final int b = (int)(rgb&0x000000FF);

				final double greyShade = 0.3 * r + 0.59 * g + 0.11 * b;
				if (greyShade >= 127) {
					raster.setSample(j, i, 0, 1);
				} else {
					raster.setSample(j, i, 0, 0);
				}
			}
		}

		return img;
	}

	public static BufferedImage splitImageRed(BufferedImage bufferedImage) {
		final int height = bufferedImage.getHeight();
		final int width = bufferedImage.getWidth();
		BufferedImage img = new BufferedImage(height, width, BufferedImage.TYPE_BYTE_GRAY);
		WritableRaster raster = img.getRaster();

		for (int i = 0; i < height; ++i) {
			for (int j = 0; j < width; ++j) {
				final int rgb = bufferedImage.getRGB(j, i);
				final int r = (int)((rgb&0x00FF0000)>>>16);
				raster.setSample(j, i, 0, r);
			}
		}

		return img;
	}

	public static BufferedImage splitImageGreen(BufferedImage bufferedImage) {
		final int height = bufferedImage.getHeight();
		final int width = bufferedImage.getWidth();
		BufferedImage img = new BufferedImage(height, width, BufferedImage.TYPE_BYTE_GRAY);
		WritableRaster raster = img.getRaster();

		for (int i = 0; i < height; ++i) {
			for (int j = 0; j < width; ++j) {
				final int rgb = bufferedImage.getRGB(j, i);
				final int g = (int)((rgb&0x0000FF00)>>>8);
				raster.setSample(j, i, 0, g);
			}
		}

		return img;
	}

	public static BufferedImage splitImageBlue(BufferedImage bufferedImage) {
		final int height = bufferedImage.getHeight();
		final int width = bufferedImage.getWidth();
		BufferedImage img = new BufferedImage(height, width, BufferedImage.TYPE_BYTE_GRAY);
		WritableRaster raster = img.getRaster();

		for (int i = 0; i < height; ++i) {
			for (int j = 0; j < width; ++j) {
				final int rgb = bufferedImage.getRGB(j, i);
				final int b = (int)(rgb&0x000000FF);

				raster.setSample(j, i, 0, b);
			}
		}

		return img;
	}

	public static void main(String[] args) {
		ImageApp ia = new ImageApp();
		BufferedImage imgJPEG = loadImage("http://www.inf.ufsc.br/~roberto.willrich/INE5431/rgb1.png");
		BufferedImage imgRGB = criaImagemRGB();
		BufferedImage imgCinza = criaImagemCinza();
		BufferedImage imgBinaria = criaImagemBinaria();


		ia.apresentaImagem(new JFrame("imgJPEG"), imgJPEG);

		// Question 1
		BufferedImage lowQualityImage = reduceQuality(imgJPEG);
		ia.apresentaImagem(new JFrame("lowQualityImage"), lowQualityImage);

		// Question 2
		BufferedImage shadesOfGrey = shadesOfGrey(imgJPEG);
		ia.apresentaImagem(new JFrame("shadesOfGrey"), shadesOfGrey);

		// Question 3
		BufferedImage binaryImage = binaryImage(imgJPEG);
		ia.apresentaImagem(new JFrame("binaryImage"), binaryImage);

		// Question 4
		BufferedImage splitImageRed = splitImageRed(imgJPEG);
		ia.apresentaImagem(new JFrame("splitImageRed"), splitImageRed);

		BufferedImage splitImageGreen = splitImageGreen(imgJPEG);
		ia.apresentaImagem(new JFrame("splitImageGreen"), splitImageGreen);

		BufferedImage splitImageBlue = splitImageBlue(imgJPEG);
		ia.apresentaImagem(new JFrame("splitImageBlue"), splitImageBlue);

		// ia.apresentaImagem(new JFrame("imgRGB"), imgRGB);
		// ia.apresentaImagem(new JFrame("imgCinza"), imgCinza);
		// ia.apresentaImagem(new JFrame("imgBinaria"), imgBinaria);

		// imprimePixeis(imgJPEG);
	}
}
