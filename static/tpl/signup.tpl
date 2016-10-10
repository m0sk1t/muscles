<article>
	<section>
		<form ng-submit="signup()">
			<input type="text" placeholder="Почта" ng-model="cred.mail"><br>
			<input type="password" placeholder="Пароль" ng-model="cred.pass"><br>
			<button type="submit">Зарегистрироваться</button>
			Или с помощью социальных сетей
			<div>
				<a href="/auth/fb">fb</a>
				<a href="/auth/vk">vk</a>
				<a href="/auth/tw">tw</a>
				<a href="/auth/im">im</a>
				<a href="/auth/ok">ok</a>
			</div>
		</form>
	</section>
</article>
