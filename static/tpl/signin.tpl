<article class="ya-dialoges ya-container">
	<div class="ya-narrower">
		<div class="ya-row">
			<div class="grid-1-1">
				<div class="ya-sign-form">
					<h2 class="ya-sign-form__title ya-center">Регистрация</h2>
					<form ng-submit="signin()" class="ya-form ya-form_wide ya-sign-form__form">
						<div class="ya-form__input ya-input ya-input_inline">
							<div class="ya-clearfix">
								<div class="ya-input__field-wrapper ya-sign-form__field ya-center">
									<input id="ya-mail" class="ya-input__field" placeholder="Почта" type="text" ng-model="cred.mail" />
								</div>
							</div>
						</div>
						<div class="ya-form__input ya-input ya-input_inline">
							<div class="ya-clearfix">
								<div class="ya-input__field-wrapper ya-sign-form__field ya-center">
									<input id="ya-pass" class="ya-input__field" placeholder="Пароль" type="password" ng-model="cred.pass" />
								</div>
							</div>
						</div>
						<div class="ya-form__input ya-input ya-input_inline">
							<div class="ya-clearfix ya-center">
								<button class="ya-btn ya-btn_secondary ya-btn_inline ya-sign-form__submit" type="submit">Войти</button>
							</div>
						</div>
						<div class="ya-center">
							Или
						</div>
						<div class="ya-center ya-sign-form__socials">
							<a href="/auth/vk" class="ya-sign-form__social-link ya-sign-form__social-link_vk"></a>
							<a href="/auth/ok" class="ya-sign-form__social-link ya-sign-form__social-link_ok"></a>
							<a href="/auth/fb" class="ya-sign-form__social-link ya-sign-form__social-link_fb"></a>
							<a href="/auth/im" class="ya-sign-form__social-link ya-sign-form__social-link_im"></a>
							<a href="/auth/tw" class="ya-sign-form__social-link ya-sign-form__social-link_tw"></a>
						</div>
						<div class="ya-center ya-sign-form__login-link">
							Еще нет аккаунта? <a href="/#/signin">Зарегистрироваться</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</article>
