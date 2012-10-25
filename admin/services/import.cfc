<cfcomponent>

	<!--- load mura scope --->
	<cfset variables.$=application.serviceFactory.getBean("MuraScope").init(session.siteID) />

	<!--- parse category and page list --->
	<cffunction name="parseStructure_list" returntype="array">
		<cfargument name="type" required="true" type="string" hint="Either 'page' or 'category'" />
		<cfargument name="list" required="true" type="string" />
		<cfargument name="parentId" required="false" type="string" default="" />
		<cfargument name="key" required="false" type="string" default="-" />

		<cfset var aResult = [] />
		<cfset var thisParentId = trim(arguments.parentId) />
		<cfset var aAncestors = [] />
		<cfset var nLevels = 1 />
		<cfset var i = 1 />
		<cfset var pkField = "contentId" />

		<!--- default parentId and number of levels --->
		<cfif len(thisParentId)>
			<cfset aAncestors = [thisParentId]>
			<cfset nLevels = arrayLen(aAncestors) />
		</cfif>

		<!--- set primary key field --->
		<cfif arguments.type eq "Category">
			<cfset pkField = "categoryId" />
		</cfif>

		<!--- loop over list --->
		<cfloop list="#arguments.list#" index="thisCat" delimiters="#chr(10)#">
			<cfset thisCat = trim(thisCat) />

			<!--- determine how many levels--->
			<cfloop index="l" from="1" to="#len(thisCat)#">
				<cfif mid(thisCat, l, 1) eq arguments.key>
					<cfset nLevels = nLevels + 1 />
				</cfif>
			</cfloop>

			<!--- if more levels than ancestors, we need to add to it --->
			<cfif arrayLen(aAncestors) lt nLevels and i gt 1>
				<cfset thisParentId = aResult[i-1].getValue("CategoryId") />
				<cfset arrayAppend(aAncestors, thisParentId)>
			</cfif>

			<cfif arrayLen(aAncestors) gt nLevels>
				<cfloop from="#arrayLen(aAncestors)#" to="1" index="j" step="-1">
					<cfif j gt nLevels>
						<cfset arrayDeleteAt(aAncestors, j) />
					</cfif>
				</cfloop>
				<!--- cfset arrayResize(aAncestors, nLevels) --->
				<cfif nLevels gte 1>
					<cfset thisParentId = aAncestors[nLevels] />
				<cfelse>
					<cfset thisParentId = arguments.parentId />
				</cfif>
			</cfif>

			<!--- populate category bean and persist --->
			<cfset aResult[i] = $.getBean( arguments.type ) />
			<cfset aResult[i].setParentId( thisParentId ) />
			<cfset aResult[i].setValue(pkField, createUUID()) />

			<!--- set fields based on content type --->
			<cfif arguments.type eq "Category">

				<cfset aResult[i].setName( replace(thisCat,"-","","all") ) />

			<cfelseif arguments.type eq "Page">

				<cfset aResult[i].setTitle( replace(thisCat,"-","","all") ) />
				<cfset aResult[i].setActive(arguments.active) />

			</cfif>

			<!--- persist --->
			<cfset aResult[i].save() />

			<!---cfdump var="#nLevels#">
			<cfdump var="#aAncestors#">
			<cfdump var="#aResult[i].getAsStruct()#"--->

			<cfset i = i + 1 />
			<cfset nLevels = listLen(arguments.parentId) />
		</cfloop>

		<cfreturn aResult />
	</cffunction>

</cfcomponent>


