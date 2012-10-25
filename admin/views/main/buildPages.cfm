<cfparam name="rc.result" default="#[]#" type="array">

<cfoutput>

	<h3>Quick Site Builder</h3>
	<hr/>

	<p>The following pages have been added:</p>

	<cfloop array="#rc.result#" index="thisItem">
		<li>#thisItem.getTitle()#</li>
	</cfloop>

</cfoutput>