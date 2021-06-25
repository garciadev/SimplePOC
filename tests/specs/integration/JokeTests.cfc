component extends="coldbox.system.testing.BaseTestCase" {

	/*********************************** LIFE CYCLE Methods ***********************************/
	function beforeAll() {
		super.beforeAll();

		getWireBox().autowire( this );

		// do your own stuff here
	}

	function afterAll() {
		// do your own stuff here
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/
	function run() {
		describe( "RESTFul get a joke call", function() {
			beforeEach( function( currentSpec ) {
				// Setup as a new ColdBox request, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();
			} );

			story( "I want to retrieve a joke", function() {
				given( "a GET call", function() {
					then( "I will return a joke", function() {
						var event = this.get(
							route  = "/api/joke",
							params = {}
						);
						var response = event.getPrivateValue( "Response" );
						expect( response.getError() ).toBeFalse( response.getMessages().toString() );
						expect( response.getData() ).toBeString();
					} );
				} );

				given( "a POST call", function() {
					then( "I will return an error", function() {
						var event = this.post(
							route  = "/api/joke",
							params = {}
						);
						var response = event.getPrivateValue( "Response" );
					} );
				} );
			} );

		} );
	}
}
