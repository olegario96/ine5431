<ncl id="myNCLDocID" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase id="rgbase1">
			<region height="100.00%" id="rgTV" left="0.00%" top="0.00%" width="100.00%" zIndex="1">
				<region height="68.96%" id="rgCentro" left="17.33%" top="17.71%" width="70.49%">
				</region>
				<region height="10.62%" id="rgIcone" left="20.02%" top="22.08%" width="8.20%">
				</region>
			</region>
		</regionBase>
		<descriptorBase id="descriptorBase1">
			<descriptor id="dscIcone" region="rgIcone">
			</descriptor>
			<descriptor id="dVideo" region="rgCentro">
			</descriptor>
		</descriptorBase>
		<connectorBase id="connectorBase1">
			<causalConnector id="onEndStart">
				<simpleAction role="start">
				</simpleAction>
				<simpleCondition role="onEnd">
				</simpleCondition>
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
					<simpleAction max="unbounded" role="start">
					</simpleAction>
					<simpleAction max="unbounded" role="stop">
					</simpleAction>
					<simpleAction max="unbounded" role="abort">
					</simpleAction>
				</compoundAction>
			</causalConnector>
		</connectorBase>
	</head>
	<body id="pInicio">
		<media descriptor="dVideo" id="video1" src="media/video1.mpg" type="video/mpeg">
		</media>
		<port component="video1" id="port1">
		</port>
		<media descriptor="dscIcone" id="iconeVerde" src="media/botao_verde.gif" type="image/gif">
		</media>
		<media descriptor="dVideo" id="video2" src="media/video2.mpg" type="video/mpeg">
		</media>
		<link id="link1" xconnector="onEndStart">
			<bind component="video1" role="onEnd">
			</bind>
			<bind component="video1" role="start">
			</bind>
		</link>
		<link id="link2" xconnector="onBeginStart">
			<bind component="video1" role="onBegin">
			</bind>
			<bind component="iconeVerde" role="start">
			</bind>
		</link>
		<link id="link3" xconnector="onKeySelectionStartStopAbort">
			<bind component="iconeVerde" role="onSelection">
				<bindParam name="keyCode" value="GREEN">
				</bindParam>
			</bind>
			<bind component="video2" role="start">
			</bind>
			<bind component="iconeVerde" role="stop">
			</bind>
			<bind component="video1" role="abort">
			</bind>
		</link>
	</body>
</ncl>
