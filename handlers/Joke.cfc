component extends="coldbox.system.RestHandler" accessors="true" {

	property name="validationConstraints" inject="box:setting:validationConstraints";

	this.prehandler_only      = "";
	this.prehandler_except    = "";
	this.posthandler_only     = "";
	this.posthandler_except   = "";
	this.aroundHandler_only   = "";
	this.aroundHandler_except = "";

	this.allowedMethods = {
        joke : "GET"
    };

	public void function preHandler( event, rc, prc ) {
        variables.JokeService = populateModel( "service.JokeService" );
	}

	function index( event, rc, prc ) {
		event.getResponse().setData( JokeService.joke() );
	}

	public void function test( event, rc, prc ) {
		var constraints = {
			"myString" : variables.validationConstraints.requiredString
		};

		var validationResults = validate( target=rc, constraints=constraints ).getAllErrors();
		event.getResponse().setData( validationResults.isEmpty() ? JokeService.joke() : validationResults );
		// If validation error, return 400
		if ( !validationResults.isEmpty() ) event.getResponse().setStatus( 400 );
	}

}
