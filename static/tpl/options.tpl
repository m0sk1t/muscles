<article class="ya-options ya-container">
	<div class="ya-narrower">
		<div class="ya-row">
			<div class="ya-grid-4-5">
				<nav class="ya-nav-menu ya-nav-menu_view_buttons ya-options__nav">
					<ul class="ya-nav-menu__list ya-clearfix">
						<li class="ya-nav-menu__item" ng-class="{'active-page': active_page === 'profile'}" ng-click="active_page = 'profile'">
							<span class="ya-nav-menu__link">Профиль<span>
						</li>
						<li class="ya-nav-menu__item" ng-class="{'active-page': active_page === 'common'}" ng-click="active_page = 'common'">
							<span class="ya-nav-menu__link">Общие<span>
						</li>
						<li class="ya-nav-menu__item" ng-class="{'active-page': active_page === 'privacy'}" ng-click="active_page = 'privacy'">
							<span class="ya-nav-menu__link">Приватность<span>
						</li>
						<li class="ya-nav-menu__item" ng-class="{'active-page': active_page === 'notifications'}" ng-click="active_page = 'notifications'">
							<span class="ya-nav-menu__link">Оповещения<span>
						</li>
					</ul>
				</nav>
				<section ng-show="active_page === 'profile'">
					<span class="avatar">
						<div>
							<img ng-src="{{options.user.avatar}}" alt="avatar">
							<div class="overlay">
								<input type="file">
							</div>
						</div>
					</span>
					<label>
						Имя
						<input type="text" ng-model="options.user.name">
					</label><br>
					<label>
						Фамилия
						<input type="text" ng-model="options.user.surname">
					</label><br>
					<label>
						Страна
						<select>
							<option></option>
						</select>
					</label><br>
					<label>
						Город
						<select>
							<option></option>
						</select>
					</label><br>
					<label>
						Статус
						<input type="text" ng-model="options.user.status">
					</label><br>
					<label>
						Пол
						<select ng-model="options.user.sex">
							<option value="n">Не скажу</option>
							<option value="m">Мужской</option>
							<option value="w">Женский</option>
						</select>
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
			<input type="checkbox" ng-model="options.user.comments_disabled">
			Отключить комментарии к записям
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
		<button ng-click="user_save();">save</button>
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
		<label>
			<select>
				<option>Все</option>
				<option>Друзья и друзья друзей</option>
				<option>Только друзья</option>
			</select>
		</label><br>
		<h3>Связь со мной</h3>
		<label>
			<select>
				<option>Все</option>
				<option>Друзья и друзья друзей</option>
				<option>Только друзья</option>
			</select>
		</label><br>
		<button ng-click="user_save();">save</button>
	</section>
	<section ng-show="active_page === 'notifications'">
		<h3>Моментальные оповещения на сайте</h3>

		<label>
			<input
				type="checkbox"
				ng-model="options.user.settings.show_notifications"
				ng-click="options.user.settings.show_notifications && request_permissions();"
			>
			Включить уведомления
		</label><br>
		<label>
		<input
			type="checkbox"
			ng-model="options.user.settings.show_notifications_text"
		>
			Показывать текст сообщений
		</label><br>

		<button>Сохранить</button>

		<h3>Оповещение по электронной почте</h3>

		<label>
			<input type="checkbox" ng-model="options.user.settings.notify_private">
			Личные сообщения
		</label><br>

		<label>
			<input type="checkbox" ng-model="options.user.settings.notify_topic_comments">
			Комментарии на стене
		</label><br>

		<label>
			<input type="checkbox" ng-model="options.user.settings.notify_photo_comments">
			Комментарии к фотографиям
		</label><br>

		<label>
			<input type="checkbox" ng-model="options.user.settings.notify_video_comments">
			Комментарии к видео
		</label><br>

		<label>
			<input type="checkbox" ng-model="options.user.settings.notify_competitions">
			Оповещения о мероприятиях
		</label><br>

		<label>
			<input type="checkbox" ng-model="options.user.settings.notify_contests">
			Оповещения о конкурсах
		</label><br>

		<label>
			<input type="checkbox" ng-model="options.user.settings.notify_birthdays">
			Дни рождения
		</label><br>
		<button ng-click="user_save();">save</button>
	</section>
			</div>
		</div>
	</div>
</article>
