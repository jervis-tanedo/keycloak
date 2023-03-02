<#macro loginLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html class="h-full bg-gray-50">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="robots" content="noindex, nofollow">
		<#if properties.meta?has_content>
			<#list properties.meta?split(' ') as meta>
				<meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
			</#list>
		</#if>
		<title>${msg("loginTitle",(realm.displayName!''))}</title>
		<link rel="icon" href="${url.resourcesPath}/img/uplb-logo.png" />

		<link rel="stylesheet" href="${url.resourcesPath}/css/styles.css" />
		<link href="https://unpkg.com/tailwindcss@^2.2.7/dist/tailwind.min.css" rel="stylesheet">
		<script src="https://cdn.tailwindcss.com/"></script>
	</head>
	<body class="h-full flex flex-col p-3">
		<#--  <header class="bg-trigo-blue">
			<nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" aria-label="Top">
				<div class="w-full py-6 flex items-center justify-between">
					<div class="flex items-center">
						<a href="#">
							<span class="sr-only">TRIGO GmbH</span>
							<img class="h-10 w-auto" src="${url.resourcesPath}/img/TRIGO-logo-human-invert.svg" alt="">
						</a>

					</div>
					<div class="ml-10 space-x-4">
						<a href="https://trigodev.com/contact-us" class="inline-block bg-white py-2 px-4 rounded-md text-base font-medium text-trigo-blue hover:bg-trigo-tangerine">Get in touch</a>
					</div>
				</div>

			</nav>
		</header>  -->

		<div class="h-full flex flex-col justify-center py-12 sm:px-6 lg:px-8">
			<div class="sm:mx-auto sm:w-full sm:max-w-md">
				<#--  <img class="mx-auto h-12 w-auto" src="${url.resourcesPath}/img/TRIGO-logo-computerface.svg" alt="logo" />  -->
				<h1 class="mt-6 text-center text-header2 tracking-header2 font-semibold text-trigo-blue">
					${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}
				</h1>
				<p class="mt-2 text-paragraph tracking-paragraph text-trigo-blue">
					<#nested "description">
				</p>
			</div>
			<div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
				<div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
					<#nested "main">
				</div>
			</div>
		</div>
	</body>
</html>
</#macro>
