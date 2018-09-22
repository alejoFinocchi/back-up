<!DOCTYPE html>

<html>
<head>
	<link rel="stylesheet" href="/styles/styles.css">
</head>
<body>
	<div class='wrapper'>
		<div class='wordSize info'>Tamanio de la palabra: `</div>
		<div class='attemptsLeft info'>Intentos restantes: `</div>
		<div class='attemptsFailed info'>Intentos fallidos: `</div>
		<div class='guessedLetters info'>Letras adivinadas: `</div>
		<div class='usedLetters info'>Letras usadas: `</div>
		<form class='letterForm' method='post' action='/partida/`'>
			<input type="hidden" name="_method" value="put"/>
			<input class='letterInput' type='text' name='attempt' placeholder='Ingresa una sola letra'>
			<input class='sendLetter' type='submit' value='Enviar'>	
		</form>
	</div>
</body>
</html>