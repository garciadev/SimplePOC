component {

	public string function getJokeFromAPI() {

        var joke = "Error retrieving joke";
        var response = "";

        cfhttp(
            url = "https://v2.jokeapi.dev/joke/Programming?blacklistFlags=nsfw,religious,political,racist,sexist,explicit&type=single",
            method = "GET",
            charset = "utf-8",
            getasbinary = "never",
            result = "response",
            timeout = 15
        ) {}

        if( isJSON( response.fileContent ) ){
            var content = deserializeJSON( response.fileContent );
            if( content.keyExists( "joke" ) && content.joke.len() > 0 ) return content.joke;
        }

        return joke;
	}

}