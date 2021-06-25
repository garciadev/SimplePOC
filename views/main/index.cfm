<cfoutput>
	<div class="row">
		<div class="col-lg-12">

			<section id="eventHandlers">
				<div class="pb-2 mt-4 mb-2 border-bottom">
					<h2>
						Greetings Program!
					</h2>
				</div>
				<p>Welcome to a Simple POC</p>

				<div class="alert alert-success" role="alert">
					<h4 class="alert-heading">Here is a joke to make your day brighter!</h4>
					<p id="joke">#prc.joke#</p>
					<button id="getAnotherJoke" type="button" class="btn btn-secondary">Get Another Joke!</button>
				</div>

				<p>Jokes courtesy <a href="https://v2.jokeapi.dev" target="_blank">https://v2.jokeapi.dev</a> using all the filter flags to keep things nicer. <span style="font-size: 2em; color: purple;"><i class="far fa-smile"></i></span></p>

				<p>Run some <a href="/tests" target="_blank">simple tests</a>.</p>

			</section>
		</div>
	</div>
</cfoutput>

<cfsavecontent variable="headerJS">
	<script>
		$(document).ready(function(){
			$('#getAnotherJoke').click(function() {
				$.get("/api/joke", function(data, status){
					$('#joke').text( data.data );
				});
			});
		});
	</script>
</cfsavecontent>

<cfhtmlhead text="#headerJS#">
