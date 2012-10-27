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
	<h2>Content Tree</h2>
	<div class="span6">
		<form action="#buildURL('admin:main.buildStructure')#" method="post" class="fieldset-wrap">
		<fieldset>
			<div class="control-group">
				<label class="control-label"> Type</label>

				<div class="controls">
					<select name="type" id="type">
						<option value="category" selected="selected">Category</option>
						<option value="content">Content</option>
					</select>
				</div>

				<label class="control-label">Parent</label>
				<div class="controls">
					<select name="parentId" id="parent">
						<option selected="selected" value="">Primary</option>
						<cfloop query="rc.qCats">
							<option value="#categoryID#"> #name# </option>
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

			<div class="form-actions"><input class="btn" type="submit" name="Submit" value=" Submit "></div>
		</form>
	</div>
</div>


<script>
	var $ = jQuery;

	var cats = #serializeJson(rc.qCats)#;
	var pages = #serializeJson(rc.qPages)#;

	var type = $('select##type');
	var parent = $('select##parent');

	type.change(function() {
		var i = 0;
		parent.empty();
		if (type.val() == 'content') {
			parent.append($("<option />").val("00000000000000000000000000000000001").text("Home"));

			pages.DATA.each(function(i){
				parent.append($("<option />").val(i[10]).text(i[0]))
			});
		} else {
			parent.append($("<option />").val("").text("Primary"));

			cats.DATA.each(function(i){
				parent.append($("<option />").val(i[0]).text(i[1]))
			});
		}

	});
</script>


</cfoutput>