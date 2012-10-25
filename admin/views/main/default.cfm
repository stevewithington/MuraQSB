<cfoutput>
<<<<<<< Updated upstream
	<h3>Quick Site Builder</h3>
	<hr/>

	<h4>Categories</h4>

	<p>Build out your Category structure using the following format pasted in to the text area below:</p>
	<p style="padding:10px">
		Category<br/>
		-Sub Cat 1<br/>
		-Sub Cat 2<br/>
		Category 2<br/>
		-Sub Cat 3<br/>
		-Sub Cat 4<br/>
		--Sub Cat 5<br/>
		Category 3<br/>
	</p>

	<form action="#buildURL('admin:main.buildCategories')#" method="post">
		<label>Parent Category:
			<select name="parentCategory">
				<option selected="selected" value="">Primary</option>
				<cfloop query="rc.qCats">
					<option value="#categoryID#"> #name# </option>
				</cfloop>
			</select>
		</label>
		<br />

		<label>Categories:</label>
		<textarea name="categories"></textarea>
		<br />

		<input type="submit" name="Submit" value="Submit Categories">
	</form>

	<hr />

	<h4>Site Tree</h4>

	<p>Build out your Site Tree:</p>

	<form action="#buildURL('admin:main.buildPages')#" method="post">
		<label>Parent Page:
			<select name="parentPage">
				<option value="00000000000000000000000000000000001">Home</option>
				<cfloop query="rc.qPages">
					<option value="#contentId#"> #title# </option>
				</cfloop>
			</select>
		</label>
		<br />
		<label>Active?:
			<input type="radio" name="active" value="0"> No
			<input type="radio" name="active" value="1" checked="checked"> Yes
		</label>

		<label>Pages:</label>
		<textarea name="pages"></textarea>
		<br />

		<input type="submit" name="Submit" value="Submit Pages">
	</form>

=======
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
>>>>>>> Stashed changes
</cfoutput>