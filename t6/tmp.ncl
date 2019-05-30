<ncl id="myNCLDocID" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<connectorBase id="connectorBase1">
			<causalConnector id="onEndStart">
				<simpleCondition role="onEnd">
				</simpleCondition>
				<simpleAction role="start">
				</simpleAction>
			</causalConnector>
			<causalConnector id="onBeginStart">
				<simpleAction role="start">
				</simpleAction>
				<simpleCondition role="onBegin">
				</simpleCondition>
			</causalConnector>
			<causalConnector id="onKeySelectionStartStopAbort">
				<connectorParam name="keyCode">
				</connectorParam>
				<simpleCondition key="$keyCode" role="onSelection">
				</simpleCondition>
				<compoundAction operator="seq">
					<simpleAction max="unbounded" qualifier="par" role="start">
					</simpleAction>
					<simpleAction max="unbounded" qualifier="par" role="stop">
					</simpleAction>
				</compoundAction>
			</causalConnector>
		</connectorBase>
		<regionBase id="regionBase1">
			<region height="100.00%" id="video1" left="0.00%" top="0.00%" width="100.00%" zIndex="1">
			</region>
			<region height="10.00%" id="rgRedButton" left="5.00%" top="5.00%" width="10.00%" zIndex="1">
			</region>
			<region height="40.00%" id="detailRegion" left="30.00%" top="20.00%" width="40.00%" zIndex="1">
			</region>
		</regionBase>
		<descriptorBase id="descriptorBase1">
			<descriptor id="dscVideo1" region="video1">
			</descriptor>
			<descriptor id="dscRedButton" region="rgRedButton">
			</descriptor>
			<descriptor id="dscGreenButton" region="detailRegion">
			</descriptor>
			<descriptor id="dscYellowButton" region="detailRegion">
			</descriptor>
			<descriptor id="dscBlueButton" region="detailRegion">
			</descriptor>
		</descriptorBase>
	</head>
	<body id="myBodyID">
		<media descriptor="dscVideo1" id="mediaVideo" src="media/video1.mpg" type="video/mpeg">
		</media>
		<media descriptor="dscRedButton" id="mediaRedButton" src="media/botao_vermelho.gif" type="image/gif">
		</media>
		<media descriptor="dscGreenButton" id="mediaGreenButton" src="media/detalhe1.gif" type="image/gif">
		</media>
		<media descriptor="dscYellowButton" id="mediaYellowButton" src="media/detalhe2.gif" type="image/gif">
		</media>
		<media descriptor="dscBlueButton" id="mediaBlueButton" src="media/detalhe3.gif" type="image/gif">
		</media>
		<port component="mediaVideo" id="port1">
		</port>
		<link id="linkVideo2RedButton" xconnector="onBeginStart">
			<bind component="mediaVideo" role="onBegin">
			</bind>
			<bind component="mediaRedButton" role="start">
			</bind>
		</link>
		<link id="linkVideo2Video" xconnector="onEndStart">
			<bind component="mediaVideo" role="onEnd">
			</bind>
			<bind component="mediaVideo" role="start">
			</bind>
		</link>
		<link id="linkRedButtonEvent" xconnector="onKeySelectionStartStopAbort">
			<bind component="mediaRedButton" role="onSelection">
				<bindParam name="keyCode" value="RED">
				</bindParam>
			</bind>
			<bind component="mediaRedButton" role="stop">
			</bind>
			<bind component="mediaGreenButton" role="start">
			</bind>
		</link>
		<link id="linkGreenButtonEvent" xconnector="onKeySelectionStartStopAbort">
			<bind component="mediaGreenButton" role="onSelection">
				<bindParam name="keyCode" value="GREEN">
				</bindParam>
			</bind>
			<bind component="mediaGreenButton" role="stop">
			</bind>
			<bind component="mediaYellowButton" role="start">
			</bind>
		</link>
		<link id="linkContinueYellowButtonEvent" xconnector="onKeySelectionStartStopAbort">
			<bind component="mediaYellowButton" role="onSelection">
				<bindParam name="keyCode" value="GREEN">
				</bindParam>
			</bind>
			<bind component="mediaYellowButton" role="stop">
			</bind>
			<bind component="mediaBlueButton" role="start">
			</bind>
		</link>
		<link id="linkBackYellowButtonEvent" xconnector="onKeySelectionStartStopAbort">
			<bind component="mediaYellowButton" role="onSelection">
				<bindParam name="keyCode" value="YELLOW">
				</bindParam>
			</bind>
			<bind component="mediaYellowButton" role="stop">
			</bind>
			<bind component="mediaGreenButton" role="start">
			</bind>
		</link>
		<link id="linkContinueBlueButtonEvent" xconnector="onKeySelectionStartStopAbort">
			<bind component="mediaBlueButton" role="onSelection">
				<bindParam name="keyCode" value="BLUE">
				</bindParam>
			</bind>
			<bind component="mediaBlueButton" role="stop">
			</bind>
			<bind component="mediaRedButton" role="start">
			</bind>
		</link>
		<link id="linkBackBlueButtonEvent" xconnector="onKeySelectionStartStopAbort">
			<bind component="mediaBlueButton" role="onSelection">
				<bindParam name="keyCode" value="YELLOW">
				</bindParam>
			</bind>
			<bind component="mediaBlueButton" role="stop">
			</bind>
			<bind component="mediaYellowButton" role="start">
			</bind>
		</link>
	</body>
</ncl>
