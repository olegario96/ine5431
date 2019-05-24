<ncl id="myNCLDocID" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<connectorBase id="connectorBaseId">
			<causalConnector id="onBeginStartDelay">
				<connectorParam name="delay">
				</connectorParam>
				<simpleCondition role="onBegin">
				</simpleCondition>
				<simpleAction delay="$delay" max="unbounded" qualifier="par" role="start">
				</simpleAction>
			</causalConnector>
			<causalConnector id="onEndStart">
				<simpleCondition role="onEnd">
				</simpleCondition>
				<simpleAction role="start">
				</simpleAction>
			</causalConnector>
			<causalConnector id="onEndStartDelay">
				<connectorParam name="delay">
				</connectorParam>
				<simpleCondition role="onEnd">
				</simpleCondition>
				<simpleAction delay="$delay" max="unbounded" qualifier="par" role="start">
				</simpleAction>
			</causalConnector>
		</connectorBase>
		<regionBase id="regionBase">
			<region height="100.00%" id="rgTV" left="0.00%" top="0.00%" width="100.00%" zIndex="1">
				<region height="10.00%" id="r1" left="5.00%" top="10.00%" width="90.00%" zIndex="2">
				</region>
				<region height="70.00%" id="r2" left="5.00%" top="25.00%" width="43.00%" zIndex="2">
				</region>
				<region height="70.00%" id="r3" left="52.00%" top="25.00%" width="43.00%" zIndex="2">
				</region>
			</region>
		</regionBase>
		<descriptorBase id="descriptorBase1">
			<descriptor explicitDur="10s" id="audioDescriptor">
			</descriptor>
			<descriptor explicitDur="8s" id="textDescriptor1" region="r1">
			</descriptor>
			<descriptor explicitDur="10s" id="textDescriptor2" region="r1">
			</descriptor>
			<descriptor explicitDur="10s" id="videoDescriptor" region="r2">
			</descriptor>
			<descriptor explicitDur="10s" id="imageDescriptor" region="r3">
			</descriptor>
		</descriptorBase>
	</head>
	<body id="bodyId">
		<port component="subtitle1" id="portSubtitle">
		</port>
		<media descriptor="textDescriptor1" id="subtitle1" src="media/legenda1.htm" type="text/html">
		</media>
		<media descriptor="textDescriptor2" id="subtitle2" src="media/legenda2.htm" type="text/html">
		</media>
		<media descriptor="audioDescriptor" id="audio1" src="media/audio1.mp3" type="audio/mp3">
		</media>
		<media descriptor="audioDescriptor" id="audio2" src="media/audio2.mp3" type="audio/mp3">
		</media>
		<media descriptor="videoDescriptor" id="video1" src="media/video1.mpg" type="video/mpeg">
		</media>
		<media descriptor="videoDescriptor" id="video2" src="media/video2.mpg" type="video/mpeg">
		</media>
		<media descriptor="imageDescriptor" id="image1" src="media/imagem1.jpg" type="image/jpeg">
		</media>
		<media descriptor="imageDescriptor" id="image2" src="media/imagem2.gif" type="image/gif">
		</media>
		<link id="connectStartComponents" xconnector="onBeginStartDelay">
			<bind component="subtitle1" role="onBegin">
			</bind>
			<bind component="audio1" role="start">
				<bindParam name="delay" value="0s">
				</bindParam>
			</bind>
			<bind component="video1" role="start">
				<bindParam name="delay" value="0s">
				</bindParam>
			</bind>
			<bind component="image1" role="start">
				<bindParam name="delay" value="0s">
				</bindParam>
			</bind>
			<bind component="subtitle2" role="start">
				<bindParam name="delay" value="9s">
				</bindParam>
			</bind>
		</link>
		<link id="connectVideos" xconnector="onEndStart">
			<bind component="video1" role="onEnd">
			</bind>
			<bind component="video2" role="start">
			</bind>
		</link>
		<link id="connectImages" xconnector="onEndStart">
			<bind component="image1" role="onEnd">
			</bind>
			<bind component="image2" role="start">
			</bind>
		</link>
		<link id="connectAudios" xconnector="onEndStart">
			<bind component="audio1" role="onEnd">
			</bind>
			<bind component="audio2" role="start">
			</bind>
		</link>
	</body>
</ncl>
