<cfoutput>
	<!doctype html>
	<html lang="en">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<title>Simple POC</title>

		<!---Base URL --->
		<base href="#event.getHTMLBaseURL()#" />

		<!---css --->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" integrity="sha512-RXf+QSDCUQs5uwRKaDoXt55jygZZm2V++WUZduaU/Ui/9EGp3f/2KZVahFZBKGH0s774sd3HmrhUy+SgOFQLVQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

		<!---js --->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	</head>
	<body data-spy="scroll" data-target=".navbar" data-offset="50" style="padding-top: 60px">
		<!---Top NavBar --->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" role="navigation">
			<a class="navbar-brand mb-0" href="#event.buildLink('')#">
				<strong><i class="fa fa-home"></i> Home</strong>
			</a>
			<a class="navbar-brand mb-0" href="#event.buildLink('checkString')#">
				<strong>String Checker</strong>
			</a>
			<a class="navbar-brand mb-0" href="#event.buildLink('about')#">
				<strong>About</strong>
			</a>
		</nav> <!---end navbar --->

		<!---Container And Views --->
		<div class="container">#renderView()#</div>

	</body>
	</html>
</cfoutput>
