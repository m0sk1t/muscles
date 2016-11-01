<article>
	<section>
		<div class="ya-info-block__content">
		<form ng-submit="signup()" class="ya-form">
				<div class="ya-form__input ya-input ya-input_inline">
					<div class="ya-clearfix">
						<div class="ya-grid-1-3 ya-right">
							<label for="ya-mail" class="ya-input__label">
								Почта
							</label>
						</div>
						<div class="ya-grid-2-3">
							<div class="ya-input__field-wrapper">
								<input id="ya-mail" class="ya-input__field" placeholder="Почта" type="text" ng-model="cred.mail" />
							</div>
						</div>
					</div>
					<p></p>
					<div class="ya-clearfix">
						<div class="ya-grid-1-3 ya-right">
							<label for="ya-pass" class="ya-input__label">
								Пароль
							</label>
						</div>
						<div class="ya-grid-2-3">
							<div class="ya-input__field-wrapper">
								<input id="ya-pass" class="ya-input__field" placeholder="Пароль" type="password" ng-model="cred.pass" />
							</div>
						</div>
					</div>
					<p></p>
					<div class="ya-clearfix">
						<button class="ya-btn ya-btn_secondary ya-btn_inline" type="submit">Зарегистрироваться</button>
					</div>
				</div>
			Или с помощью социальных сетей
			<div>
				<a href="/auth/fb">Facebook</a>
				<a href="/auth/vk">VKontakte</a>
				<a href="/auth/tw">Twitter</a>
				<a href="/auth/im">Instagram</a>
				<a href="/auth/ok">Odnoklassniki</a>
			</div>
		</form>
	</section>
</article>
