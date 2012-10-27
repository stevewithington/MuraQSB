<cfparam name="rc.result" default="#[]#" type="array">

<cfoutput>

	<h2>The following have been added to your site:</h2>
	<div class="alert alert-info">
	<ul>
	<cfloop array="#rc.result#" index="thisItem">
		<cfif thisItem.getType() eq "category">
			<li>#thisItem.getName()#</li>
		<cfelse>
			<li>#thisItem.getTitle()#</li>
		</cfif>

	</cfloop>
	</ul>
	</div>
</cfoutput>