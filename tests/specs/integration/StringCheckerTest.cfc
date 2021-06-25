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
		describe( "RESTFul get stringChecker calls", function() {
			beforeEach( function( currentSpec ) {
				// Setup as a new ColdBox request, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();
			} );

			story( "I want to check an anagram", function() {
				given( "a GET call", function() {
					then( "I will return true", function() {
						var event = this.get(
							route  = "/api/checkAnagram",
							params = {
                                string1 : "a",
                                string2 : "a"
                            }
						);
						var response = event.getPrivateValue( "Response" );
						expect( response.getError() ).toBeFalse( response.getMessages().toString() );
						expect( response.getData() ).toBeTrue();
					} );
				} );

				given( "a GET call", function() {
					then( "I will return false", function() {
						var event = this.get(
							route  = "/api/checkAnagram",
							params = {
                                string1 : "a",
                                string2 : "b"
                            }
						);
						var response = event.getPrivateValue( "Response" );
						expect( response.getError() ).toBeFalse( response.getMessages().toString() );
						expect( response.getData() ).notToBeTrue();
					} );
				} );

				given( "a GET call", function() {
					then( "I will return an error when not passing in data", function() {
						var event = this.get(
							route  = "/api/checkAnagram",
							params = {}
						);
						var response = event.getPrivateValue( "Response" );
                        expect( response.getStatusCode() ).toBe( 400 );
					} );
				} );

				given( "a POST call", function() {
					then( "I will be return an error", function() {
						var event = this.post(
							route  = "/api/checkAnagram",
							params = {
                                string1 : "a",
                                string2 : "b"
                            }
						);
						var response = event.getPrivateValue( "Response" );
                        expect( response.getError() ).toBeTrue();
					} );
				} );


			} );

			story( "I want to check a palindrome", function() {
				given( "a GET call", function() {
					then( "I will return true", function() {
						var event = this.get(
							route  = "/api/checkPalindrome",
							params = {
                                string1 : "123",
                                string2 : "321"
                            }
						);
						var response = event.getPrivateValue( "Response" );
						expect( response.getError() ).toBeFalse( response.getMessages().toString() );
						expect( response.getData() ).toBeTrue();
					} );
				} );

				given( "a GET call", function() {
					then( "I will return false", function() {
						var event = this.get(
							route  = "/api/checkPalindrome",
							params = {
                                string1 : "123",
                                string2 : "123"
                            }
						);
						var response = event.getPrivateValue( "Response" );
						expect( response.getError() ).toBeFalse( response.getMessages().toString() );
						expect( response.getData() ).notToBeTrue();
					} );
				} );

				given( "a GET call", function() {
					then( "I will return an error when not passing in data", function() {
						var event = this.get(
							route  = "/api/checkPalindrome",
							params = {}
						);
						var response = event.getPrivateValue( "Response" );
                        expect( response.getStatusCode() ).toBe( 400 );
					} );
				} );

				given( "a POST call", function() {
					then( "I will be return an error", function() {
						var event = this.post(
							route  = "/api/checkPalindrome",
							params = {
                                string1 : "a",
                                string2 : "b"
                            }
						);
						var response = event.getPrivateValue( "Response" );
                        expect( response.getError() ).toBeTrue();
					} );
				} );

			} );

		} );
	}
}
