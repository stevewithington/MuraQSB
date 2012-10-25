<cfoutput>
<p>Build out your structure using the following format pasted in to the text area below:</p>

<pre>
	Category
	-Sub Cat
	-Sub Cat
	Category
	-Sub Cat
	-Sub Cat
	--Sub Cat
	Category
</pre>

<div class="row-fluid">
	<div class="span6">
		<h2>Tree</h2>
		<form action="#buildURL('admin:main.buildStructure')#" method="post" class="fieldset-wrap">
			<fieldset>
				<div class="control-group">
					<label class="control-label"> Type</label>

					<div class="controls">
						<select name="type">
							<option value="category">Category</option>
							<option value="page">Page</option>
						</select>
					</div>

					<label class="control-label">Parent</label>
					<div class="controls">
						<select name="parentCategory">
							<option selected="selected" value="">Primary</option>
							<cfloop query="rc.qCats">
								<option value="#categoryID#"> #name# </option>
							</cfloop>
						</select>
					</div>

					<!--- page-specific options--->
					<label class="control-label">Parent Page</label>
					<div class="controls">
						<select name="parentPage">
							<option value="00000000000000000000000000000000001">Home</option>
							<cfloop query="rc.qPages">
								<option value="#contentId#">#title#</option>
							</cfloop>
						</select>
					</div>

					<label class="control-label">Active?</label>
					<div class="controls">
						<label class="radio inline">
							<input type="radio" name="active" value="0"> No
						</label>
						<label class="radio inline">
							<input type="radio" name="active" value="1" checked="checked">Yes
						</label>
					</div>


				</div>

				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls"><textarea rows="10" class="span12" name="list"></textarea></div>
				</div>
			</fieldset>

			<div class="form-actions"><input class="btn" type="submit" name="Submit" value="Submit Categories"></div>
		</form>
	</div>
</div>
</cfoutput>