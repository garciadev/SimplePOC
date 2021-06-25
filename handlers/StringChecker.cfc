component extends="coldbox.system.RestHandler" {

	property name="validationConstraints" inject="box:setting:validationConstraints";

	this.prehandler_only      = "";
	this.prehandler_except    = "";
	this.posthandler_only     = "";
	this.posthandler_except   = "";
	this.aroundHandler_only   = "";
	this.aroundHandler_except = "";

	this.allowedMethods = {
        checkAnagram : "GET",
        checkPalindrome : "GET"
    };

	public void function preHandler( event, rc, prc ) {
        variables.StringCheckerService = populateModel( "service.StringCheckerService" );
	}

	public void function checkAnagram( event, rc, prc ) {
		var constraints = {
			"string1" : variables.validationConstraints.requiredString,
            "string2" : variables.validationConstraints.requiredString
		};
		var validationResults = validate( target=rc, constraints=constraints ).getAllErrors();
		event.getResponse().setData( validationResults.isEmpty() ? StringCheckerService.checkAnagram() : validationResults );

		// If validation error, return 400
		if ( !validationResults.isEmpty() ) event.getResponse().setStatus( 400 );
	}

	public void function checkPalindrome( event, rc, prc ) {
		var constraints = {
			"string1" : variables.validationConstraints.requiredString,
            "string2" : variables.validationConstraints.requiredString
		};
		var validationResults = validate( target=rc, constraints=constraints ).getAllErrors();
		event.getResponse().setData( validationResults.isEmpty() ? StringCheckerService.checkPalindrome() : validationResults );

		// If validation error, return 400
		if ( !validationResults.isEmpty() ) event.getResponse().setStatus( 400 );
	}

}
