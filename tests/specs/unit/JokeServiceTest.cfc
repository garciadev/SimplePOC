component extends="coldbox.system.testing.BaseTestCase" {

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll() {
		structDelete( application, "cbController" );
		structDelete( application, "wirebox" );
		super.beforeAll();
	}

	function afterAll() {
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run() {
		describe( "JokeService", function() {
			beforeEach( function( currentSpec ) {
				setup();
				model = getInstance( "service.JokeService" );
			} );

			it( "can be created", function() {
				expect( model ).toBeComponent();
			} );

			it( "can get a joke", function() {
				var oJoke = model.joke();
				expect( oJoke ).notToBeEmpty();
			} );

		} );
	}

}
