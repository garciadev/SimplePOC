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
		describe( "StringCheckerService", function() {
			beforeEach( function( currentSpec ) {
				setup();
				model = getInstance( "service.StringCheckerService" );
			} );

			it( "can be created", function() {
				expect( model ).toBeComponent();
			} );

			it( "can call check an anagram", function() {
				var oAnagram = model.checkAnagram();
				expect( oAnagram ).toBeTrue();
			} );

			it( "can call check an anagram with success", function() {
				var oAnagram = model.checkAnagram( string1="a", string2="a" );
				expect( oAnagram ).toBeTrue();
			} );

			it( "can call check an anagram with fail", function() {
				var oAnagram = model.setString1( "a" ).setString2( "b" ).checkAnagram();
				expect( oAnagram ).notToBeTrue();
			} );

			it( "can call check a palindrome", function() {
				var oPalindrome = model.checkPalindrome();
				expect( oPalindrome ).toBeTrue();
			} );

			it( "can call check a palindrome with success", function() {
				var oPalindrome = model.checkPalindrome( string1="123", string2="321" );
				expect( oPalindrome ).toBeTrue();
			} );

			it( "can call check a palindrome with fail", function() {
				var oPalindrome = model.setString1( "123" ).setString2( "123" ).checkPalindrome();
				expect( oPalindrome ).notToBeTrue();
			} );

			it( "can call convertStringToAsciiStructure with success", function() {
                makePublic( model, "convertStringToAsciiStructure", "convertStringToAsciiStructure" )
				var oConvertStringToAsciiStructure = model.convertStringToAsciiStructure( stringToConvert="abc" );
                expect( oConvertStringToAsciiStructure ).notToBeEmpty();
			} );

			it( "can call convertStringToAsciiStructure with an empty string", function() {
                makePublic( model, "convertStringToAsciiStructure", "convertStringToAsciiStructure" )
				var oConvertStringToAsciiStructure = model.convertStringToAsciiStructure( stringToConvert="" );
                expect( oConvertStringToAsciiStructure ).toBeEmpty();
			} );

		} );
	}

}
