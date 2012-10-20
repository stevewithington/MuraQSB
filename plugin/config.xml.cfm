<cfoutput><plugin>
	<name>Quick Site Builder</name>
	<package>QSB</package>
	<directoryFormat>packageOnly</directoryFormat>
	<loadPriority>5</loadPriority>
	<version>.1</version>
	<provider>Nick Sollecito</provider>
	<providerURL>http://nicksollecito.com</providerURL>
	<category>Utility</category>
	<settings>
		<!---<setting>
			<name>Setting Name</name>
			<label>Setting Label</label>
			<hint>Setting Hint</hint>
			<type>RadioGroup</type>
			<required>false</required>
			<validation></validation>
			<regex></regex>
			<message>Setting message</message>
			<defaultvalue>1</defaultvalue>
			<optionlist>0^1</optionlist>
			<optionlabellist>No^Yes</optionlabellist>
		</setting>--->
	</settings>
	<eventHandlers>
		<eventHandler event="onApplicationLoad" component="pluginEventHandler" persist="false" />
	</eventHandlers>
	<displayobjects location="global">
		<displayobject name="QSB" displaymethod="renderApp" component="pluginEventHandler" persist="false" />
	</displayobjects>
</plugin></cfoutput>