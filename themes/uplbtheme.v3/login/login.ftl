<#import "tailwind-template.ftl" as template>
<@template.loginLayout ; section>
	<#if section = "main">

		<div>
			<#if realm.password && social.providers??>
				<div class="">
					<p class="text-paragraph text-paragraph tracking-paragraph text-trigo-blue">
						${msg("Login using Google")}
					</p>

					<#--  <div class="mt-1 grid grid-cols-3 gap-3">  -->
					<div class="m-1">
						<#list social.providers as p>
							<div>
								<a type="button" href="${p.loginUrl}" id="social-${p.alias}" class="w-full inline-flex justify-center py-2 px-4 border rounded-md shadow-sm bg-white text-sm font-medium">
									<span class="sr-only">${msg("socialLoginDescription")} ${p.displayName!}</span>
									<#if p.providerId = "github">
										<#--  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
											<path fill-rule="evenodd" d="M10 0C4.477 0 0 4.484 0 10.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0110 4.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.203 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.942.359.31.678.921.678 1.856 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0020 10.017C20 4.484 15.522 0 10 0z" clip-rule="evenodd" />
										</svg>  -->
										
									<#else>
										<span>
										<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
										width="48" height="48"
										viewBox="0 0 48 48"
										style=" fill:#40C057;">
										<path 
											fill="#fbc02d" 
											d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12	s5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24s8.955,20,20,20	s20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z">
										</path>
										<path 
											fill="#e53935" 
											d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039	l5.657-5.657C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"></path>
										<path 
											fill="#4caf50" 
											d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36	c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"></path>
										<path 
											fill="#1565c0" 
											d="M43.611,20.083L43.595,20L42,20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571	c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z">
										</path>
										</svg>${p.displayName!}</span>
									</#if>
								</a>
							</div>
						</#list>
					</div>

					<div class="mt-10 relative">
						<div class="absolute inset-0 flex items-center" aria-hidden="true">
						<div class="w-full border-t border-trigo-blue"></div>
						</div>
						<div class="relative flex justify-center text-sm">
						<span class="px-2 bg-white text-small tracking-paragraph text-trigo-blue">
							${msg("Or login using your UP mail account")}
						</span>
						</div>
					</div>
				</div>
			<#else>
				<div>
					<p class="text-paragraph text-paragraph tracking-paragraph text-trigo-blue">
						${kcSanitize(msg("loginDescriptionHtml",(realm.displayNameHtml!'')))?no_esc}
					</p>
				</div>
			</#if>
			<div class="mt-10">
				<form class="space-y-6" id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
					<div>
						<label for="username" class="block text-paragraph tracking-paragraph text-trigo-blue text-trigo-blue">
							${msg("usernameOrEmail")}
						</label>
						<div class="mt-1 relative">
							<input tabindex="1" id="username" name="username" value="${(username!'')}" type="text" autofocus autocomplete="off" required class="appearance-none block w-full px-3 py-2 focus:outline-none text-paragraph tracking-paragraph border <#if messagesPerField.existsError('username','password')>border-trigo-tangerine placeholder-trigo-tangerine focus:ring-trigo-tangerine focus:border-trigo-tangerine<#else>border-gray-300 placeholder-gray-400 focus:ring-trigo-blue focus:border-trigo-blue</#if>" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>">
							<#if messagesPerField.existsError('username','password')>
								<div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
									<svg class="h-5 w-5 text-trigo-tangerine" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
										<path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
									</svg>
								</div>
							</#if>
						</div>
						<#if messagesPerField.existsError('username','password')>
							<p class="mt-2 text-paragraph tracking-paragraph text-trigo-tangerine" id="email-error" aria-live="polite">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
						</#if>
					</div>

					<div class="space-y-1">
					<label for="password" class="block text-paragraph tracking-paragraph text-trigo-blue text-trigo-blue">
						${msg("password")}
					</label>
					<div class="mt-1">
						<input tabindex="2" id="password" name="password" type="password" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" autocomplete="current-password" class="appearance-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-400 focus:outline-none focus:ring-trigo-blue focus:border-trigo-blue text-paragraph tracking-paragraph">
					</div>
					</div>
					<#if realm.rememberMe || realm.resetPasswordAllowed>
						<div class="flex items-center justify-between">
							<#if realm.rememberMe>
								<div class="flex items-center">
									<input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="h-4 w-4 text-trigo-blue focus:ring-trigo-blue border-trigo-blue rounded">
									<label for="rememberMe" class="ml-2 block text-small tracking-paragraph text-trigo-blue">
										${msg("rememberMe")}
									</label>
								</div>
							</#if>
							<#if realm.resetPasswordAllowed>
							<div>
								<a href="${url.loginResetCredentialsUrl}" tabindex="5" class="text-small tracking-paragraph text-trigo-blue">
									${msg("doForgotPassword")}
								</a>
							</div>
						</#if>
						</div>
					</#if>

					<div>
						<input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>>
						<button tabindex="4" type="submit" name="login" id="kc-login" class="w-full inline-flex justify-center py-2 px-4 border rounded-md shadow-sm bg-white text-sm font-medium bg-red-700 hover:bg-red-600 text-white">
							${msg("doLogIn")}
						</button>
					</div>
				</form>
				<#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            		<div id="kc-registration-container">
                		<div id="kc-registration">
                    		<span>${msg("noAccount")} <a tabindex="6"
                                                 href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                		</div>
            		</div>
        		</#if>
			</div>
		</div>
    </#if>
</@template.loginLayout>
