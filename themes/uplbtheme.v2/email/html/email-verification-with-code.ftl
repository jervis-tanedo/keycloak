<html>
<head>
<link href="https://unpkg.com/tailwindcss@^2.2.7/dist/tailwind.min.css" rel="stylesheet">
		<script src="https://cdn.tailwindcss.com/"></script>
</head>
<body>
${kcSanitize(msg("emailVerificationBodyCodeHtml",code))?no_esc}
</body>
</html>
