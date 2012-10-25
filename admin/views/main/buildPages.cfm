<cfparam name="rc.result" default="#[]#" type="array">

<cfoutput>

	<h2>The following pages have been added:</h2>
	<div class="alert alert-info">
	<ul>
	<cfloop array="#rc.result#" index="thisItem">
		<li>#thisItem.getTitle()#</li>
	</cfloop>
	</ul>
	</div>
</cfoutput>