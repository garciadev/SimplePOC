component displayName="JokeService" accessors="true" {

    property name="JokeGateway" inject="gateway.JokeGateway";

	public models.service.JokeService function init() {
		return this;
	}

	public string function joke() {
        return JokeGateway.getJokeFromAPI();
	}

}
