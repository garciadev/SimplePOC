<h1>Check String</h1>

<p>Use the form to do a case sensitive check of the strings.</p>

<p><strong>Note:</strong> trailing spaces will get trimmed.</p>

<div id="error" class="alert alert-danger" role="alert" style="display:none">
    <h4 class="alert-heading">Please enter values for String1 and String2</h4>
</div>

<div class="mb-3">
    <label for="string1" class="form-label">String 1</label>
    <input type="text" class="form-control" id="string1" placeholder="Enter string 1">
</div>

<div class="mb-3">
  <label for="string2" class="form-label">String 2</label>
  <input type="text" class="form-control" id="string2" placeholder="Enter string 2">
</div>

<p><select id="functionSelection" class="form-select form-select-sm" aria-label=".form-select-sm example">
  <option value="1">Check if the strings are anagrams</option>
  <option value="2">Check if the strings are palindromes</option>
</select></p>

</p><button id="checkStrings" type="button" class="btn btn-secondary">Check the strings!</button></p>

<div id="results" class="alert" role="alert" style="display:none">
    <h4 id="message" class="alert-heading"></h4>
</div>

<cfsavecontent variable="headerJS">
	<script>
		$(document).ready(function(){
			$('#checkStrings').click(function() {

                string1 = $( "#string1" ).val().trim();
                string2 = $( "#string2" ).val().trim();
                functionSelection = $( "#functionSelection" ).val();
                $('#error').hide();
                $('#results').hide();

                if( string1.length == 0 || string2.length == 0 ){
                    $('#error').show();
                    return;
                }

                functionToCall = $( "#functionSelection" ).val() == 1 ? "checkAnagram" : "checkPalindrome";

                $.get("/api/" + functionToCall, { string1 : string1, string2 : string2 }, function(data, status, xhr){
                    if ( data.data ){
                        message = "The strings PASSED the check!";
                        $('#results').removeClass( "alert-danger" ).addClass( "alert-success" );
                    } else {
                        message = "The strings FAILED the check!";
                        $('#results').removeClass( "alert-success" ).addClass( "alert-danger" );
                    }
				})
                .fail(function() {
                    message = "There was an error calling the API. Please try again.";
                    $('#results').removeClass( "alert-success" ).addClass( "alert-danger" );
                }).always(function() {
                    $('#message').text( message );
                    $('#results').show();
                });;

			});
		});
	</script>
</cfsavecontent>

<cfhtmlhead text="#headerJS#">
