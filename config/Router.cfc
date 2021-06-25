component {

	function configure() {
		// Set Full Rewrites
		setFullRewrites( true );

		// A nice healthcheck route example
		route( "/healthcheck", function( event, rc, prc ) {
			return "Ok!";
		} );

		// API
		get( "/api/joke", "Joke.index" );
		get( "/api/checkAnagram", "stringChecker.checkAnagram" );
		get( "/api/checkPalindrome", "stringChecker.checkPalindrome" );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
