<!---

This file is part of muraFW1
(c) Stephen J. Withington, Jr. | www.stephenwithington.com

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

		Document:	/admin/controllers/main.cfc
		Author:		Steve Withington | www.stephenwithington.com

--->
<cfcomponent extends="controller" output="false">

	<!--- load mura scope --->
	<cfparam name="session.siteID" default="default">
	<cfset variables.$=application.serviceFactory.getBean("MuraScope").init(session.siteID) />

	<!--- ********************************* PAGES ******************************************* --->

	<cffunction name="default" output="false" returntype="any">
		<cfargument name="rc" />

		<cfif isDefined('session.mura')>
			<!--- get categories --->
			<cfset rc.qCats = $.getBean( "category" ).getKidsQuery() />
			<!--- get pages --->
			<cfset rc.qPages = $.getBean('content').loadBy(filename='').getKidsQuery() />
		<cfelse>
			<cfset variables.fw.redirect(action="main.error") />
		</cfif>
	</cffunction>


	<cffunction name="buildStructure" output="false" returntype="any">
		<cfargument name="rc" />

		<cfparam name="rc.type">
		<cfparam name="rc.parentId">

		<cfset var args.type = rc.type />
		<cfset var args.list = rc.list />
		<cfset var args.parentId = rc.parentId />
		<cfset variables.fw.service( "import.parseStructure_list", "result", args ) />
	</cffunction>

</cfcomponent>
