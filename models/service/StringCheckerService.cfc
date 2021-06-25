component displayName="StringCheckerService" accessors="true" {

    property name="string1" type="string" default="";
    property name="string2" type="string" default="";

	public models.service.StringCheckerService function init() {
		return this;
	}

    public boolean function checkAnagram() {
        var config = {
            struct1 : convertStringToAsciiStructure( getString1() ),
            struct2 : convertStringToAsciiStructure( getString2() )
        };

        if( config.struct1.count() != config.struct2.count() ) return false;

        for ( var key in config.struct1 ) {
            if( !config.struct2.keyExists( key ) ) return false;
            if( config.struct1[ key] != config.struct2[ key] ) return false;
        }

        return true;
    }

    private struct function convertStringToAsciiStructure( required string stringToConvert ) {
        var stringStructure = {};
        var current = "";

        for ( var i=1; i <= arguments.stringToConvert.len(); i=i+1 ) {
            current = asc( mid( arguments.stringToConvert, i, 1 ) );

            if( !stringStructure.keyExists( current ) ){
                stringStructure.append( { "#current#" : 1 }, false );
            } else{
                stringStructure[ "#current#" ]++;
            }
        }

        return stringStructure;
    }

    public boolean function checkPalindrome() {
        if( getString1().len() != getString2().len() ) return false;
        if( compare( getString1(), getString2().reverse() ) != 0)  return false;
        return true;
    }

}
