<article>
	<nav class="options">
		<ul>
			<li class="option-page" ng-class="{'active-page': active_page === 'profile'}" ng-click="active_page = 'profile'">Профиль</li>
			<li class="option-page" ng-class="{'active-page': active_page === 'common'}" ng-click="active_page = 'common'">Общие</li>
			<li class="option-page" ng-class="{'active-page': active_page === 'security'}" ng-click="active_page = 'security'">Безопасность</li>
			<li class="option-page" ng-class="{'active-page': active_page === 'privacy'}" ng-click="active_page = 'privacy'">Приватность</li>
			<li class="option-page" ng-class="{'active-page': active_page === 'notifications'}" ng-click="active_page = 'notifications'">Оповещения</li>
		</ul>
	</nav>
	<section ng-show="active_page === 'profile'">
		<label>
			Имя
			<input type="text" ng-model="options.user.name">
		</label><br>
		<label>
			Фамилия
			<input type="text" ng-model="options.user.surname">
		</label><br>
		<label>
			Статус
			<input type="text" ng-model="options.user.status">
		</label><br>
		<label>
			Волосы
			<select ng-model="options.user.hairs">
				<option>Брюнет</option>
				<option>Блондин</option>
				<option>Рыжий</option>
				<option>Зелёноволосый</option>
				<option>Фиолетововолосый</option>
			</select>
		</label><br>
		<label>
			Типаж
			<select ng-model="options.user.type">
				<option>Спортивный</option>
				<option>Пухлый</option>
				<option>Атлет</option>
				<option>Дрищ</option>
			</select>
		</label><br>
		<div>
			Дата рождения
			<datepicker
				style="width: 11rem; float: none;"
				date-format="dd/MM/yyyy"
			>
				<input ng-model="options.user.birthDate" type="text"/>
			</datepicker>
		</div><br>
		<label>
			Рост
			<input type="number" ng-model="options.user.height">
		</label><br>
		<label>
			Вес
			<input type="number" ng-model="options.user.weight">
		</label><br>
		<label>
			Грудь
			<input type="number" ng-model="options.user.chest">
		</label><br>
		<label>
			Талия
			<input type="number" ng-model="options.user.waist">
		</label><br>
		<label>
			Бёдра
			<input type="number" ng-model="options.user.huckle">
		</label><br>
		<button ng-click="user_save();">save</button>
	</section>
	<section ng-show="active_page === 'common'">
		<label>
			<input type="checkbox" ng-model="options.user.enable_comments">
			Отключить комментарии на странице
		</label><br>
		<label>
			Старый пароль
			<input type="password" ng-model="cred.old_password">
		</label><br>
		<label>
			Новый пароль
			<input type="password" ng-model="cred.new_password">
		</label><br>
		<button>Изменить пароль</button>
		<label>
			Номер телефона
			<input type="tel" ng-model="options.user.phone">
		</label><br>
		<label>
			<input type="checkbox" ng-model="options.user.use_large_fonts">
			Использовать увеличенные шрифты
		</label><br>
	</section>
	<section ng-show="active_page === 'security'">
		Активность
		<div>Chrome (12.11.2012)</div>
		<div>Chrome (12.11.2012)</div>
		<div>Chrome (12.11.2012)</div>
		<div>Chrome (12.11.2012)</div>
	</section>
	<section ng-show="active_page === 'privacy'">
		<h3>Моя страница</h3>
		<label>
			Кто видит информацию обо мне
			<select>
				<option>Все</option>
				<option>Друзья и друзья друзей</option>
				<option>Только друзья</option>
			</select>
		</label><br>
		<h3>Записи на странице</h3>
			<select>
				<option>Все</option>
				<option>Друзья и друзья друзей</option>
				<option>Только друзья</option>
			</select>
		<h3>Связь со мной</h3>
			<select>
				<option>Все</option>
				<option>Друзья и друзья друзей</option>
				<option>Только друзья</option>
			</select>
	</section>
	<section ng-show="active_page === 'notifications'">
		<h3>Моментальные оповещения на сайте</h3>

		<label>
			<input type="checkbox" ng-model="options.user">
			Показывать текст сообщений
		</label><br>
		<label>
			<input type="checkbox" ng-model="options.user">
			Включить звуковые оповещения
		</label><br>

		<button>Сохранить</button>

		<h3>Оповещение по электронной почте</h3>

		<label>
			<input type="checkbox" ng-model="options.user">
			Личные сообщения
		</label><br>

		<label>
			<input type="checkbox" ng-model="options.user">
			Комментарии на стене
		</label><br>

		<label>
			<input type="checkbox" ng-model="options.user">
			Комментарии к фотографиям
		</label><br>

		<label>
			<input type="checkbox" ng-model="options.user">
			Комментарии к видео
		</label><br>

		<label>
			<input type="checkbox" ng-model="options.user">
			Грядущие мероприятия и конкурсы
		</label><br>

		<label>
			<input type="checkbox" ng-model="options.user">
			Сообщения и ответы с форума
		</label><br>

		<label>
			<input type="checkbox" ng-model="options.user">
			Оповещения по конкурсам
		</label><br>

		<label>
			<input type="checkbox" ng-model="options.user">
			Дни рождения
		</label><br>
		<button>save</button>
	</section>
</article>
