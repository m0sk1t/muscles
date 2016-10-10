<article class="ya-options ya-container">
	<div class="ya-narrower">
		<div class="ya-row">
			<div class="ya-grid-4-5">
				<nav class="ya-nav-menu ya-nav-menu_view_buttons ya-options__nav">
					<ul class="ya-nav-menu__list ya-clearfix">
						<li class="ya-nav-menu__item" ng-click="active_page = 'profile'">
							<span class="ya-nav-menu__link" ng-class="{'ya-nav-menu__link_active': active_page === 'profile'}">Профиль<span>
						</li>
						<li class="ya-nav-menu__item" ng-click="active_page = 'common'">
							<span class="ya-nav-menu__link" ng-class="{'ya-nav-menu__link_active': active_page === 'common'}">Общие<span>
						</li>
						<li class="ya-nav-menu__item" ng-click="active_page = 'privacy'">
							<span class="ya-nav-menu__link" ng-class="{'ya-nav-menu__link_active': active_page === 'privacy'}">Приватность<span>
						</li>
						<li class="ya-nav-menu__item" ng-click="active_page = 'notifications'">
							<span class="ya-nav-menu__link" ng-class="{'ya-nav-menu__link_active': active_page === 'notifications'}">Оповещения<span>
						</li>
					</ul>
				</nav>
				<div class="ya-page__block ya-page__block_bordered ya-options__block">
					<div class="ya-options__info-block ya-info-block_border_no" ng-show="active_page === 'profile'">
						<div class="ya-info-block__title">
							Настройки профиля
						</div>
						<div class="ya-info-block__content">
							<div class="ya-form">
								<div class="ya-options__avatar ya-form__input ya-input">
									<div class="ya-avatar ya-avatar_large">
										<img class="ya-avatar__img" ng-src="{{options.user.avatar || '/images/avatar.jpg'}}" alt="{{user.name}} {{user.surname}}">
									</div>
									<div class="ya-form__input ya-input">
										<label class="ya-input__field ya-input__field_file ya-clearfix">
											<span class="ya-span-2-3">
												<mark class="ya-input__file-title ya-input__file-wrapper">{{fileName|| 'Файл не выбран'}}</mark>
											</span>
											<span class="ya-span-1-3">
												<span class="ya-btn ya-input__file-wrapper ya-btn_primary ya-input__btn">Файл</span>
											</span>
											<input
												ngf-multiple="false"
												ngf-pattern="'image/*'"
												ngf-select="upload_photo($files[0])"
												class="ya-input__field ya-input__field_hidden" type="file" />
										</label>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-name" class="ya-input__label">
												Имя
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<input id="ya-name" class="ya-input__field" type="text" ng-model="options.user.name" />
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-surname" class="ya-input__label">
												Фамилия
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<input id="ya-surname" class="ya-input__field" type="text" ng-model="options.user.surname" />
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-country" class="ya-input__label">
												Страна
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<select id="ya-country" class="ya-input__field ya-input__field_select ya-input__select">
													<option></option>
													<option selected>Россия</option>
													<option>Белорусия</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-city" class="ya-input__label">
												Город
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<select id="ya-city" class="ya-input__field ya-input__field_select ya-input__select">
													<option></option>
													<option>Москва</option>
													<option selected>Иваново</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-status" class="ya-input__label">
												Статус
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<input id="ya-status" class="ya-input__field" type="text" ng-model="options.user.status" />
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-sex" class="ya-input__label">
												Пол
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<select id="ya-sex" class="ya-input__field ya-input__field_select ya-input__select" ng-model="options.user.sex">
													<option value="n">Не скажу</option>
													<option value="m">Мужской</option>
													<option value="w">Женский</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-hairs" class="ya-input__label">
												Волосы
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<select id="ya-hairs" class="ya-input__field ya-input__field_select ya-input__select" ng-model="options.user.hairs">
													<option>Брюнет</option>
													<option>Блондин</option>
													<option>Рыжий</option>
													<option>Зелёноволосый</option>
													<option>Фиолетововолосый</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-type" class="ya-input__label">
												Типаж
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<select id="ya-type" class="ya-input__field ya-input__field_select ya-input__select" ng-model="options.user.type">
													<option>Спортивный</option>
													<option>Пухлый</option>
													<option>Атлет</option>
													<option>Дрищ</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-birth" class="ya-input__label">
												Дата рождения
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<datepicker style="width: 11rem; float: none;">
													<input id="ya-birth" class="ya-input__field" type="text" ng-model="options.user.birthDate" />
												</datepicker>
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-height" class="ya-input__label">
												Рост
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<input id="ya-height" class="ya-input__field" type="number" ng-model="options.user.height" />
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-weight" class="ya-input__label">
												Вес
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<input id="ya-weight" class="ya-input__field" type="number" ng-model="options.user.weight" />
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-chest" class="ya-input__label">
												Грудь
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<input id="ya-chest" class="ya-input__field" type="number" ng-model="options.user.chest" />
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-waist" class="ya-input__label">
												Талия
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<input id="ya-waist" class="ya-input__field" type="number" ng-model="options.user.waist" />
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-3 ya-right">
											<label for="ya-huckle" class="ya-input__label">
												Бёдра
											</label>
										</div>
										<div class="ya-grid-2-3">
											<div class="ya-input__field-wrapper">
												<input id="ya-huckle" class="ya-input__field" type="number" ng-model="options.user.huckle" />
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form__input ya-input ya-input_inline">
									<div class="ya-clearfix">
										<div class="ya-grid-1-1 ya-center">
											<button ng-click="user_save();" class="ya-btn ya-btn_secondary ya-btn_inline">Сохранить</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ya-options__info-block" ng-show="active_page === 'common'">
						<div class="ya-info-block">
							<div class="ya-info-block__content">
								<div class="ya-form">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<label>
													<input type="checkbox" ng-model="options.user.comments_enabled">
													Включить комментарии к записям
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ya-info-block">
							<div class="ya-info-block__title">
								Адрес вашей электронной почты
							</div>
							<div class="ya-info-block__content">
								<div class="ya-form">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-3 ya-right">
												<label for="ya-old-mail" class="ya-input__label">
													Текущий адрес
												</label>
											</div>
											<div class="ya-grid-2-3">
												<div class="ya-input__field-wrapper">
													<input id="ya-old-mail" class="ya-input__field" type="text" />
												</div>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-3 ya-right">
												<label for="ya-new-mail" class="ya-input__label">
													Новый адрес
												</label>
											</div>
											<div class="ya-grid-2-3">
												<div class="ya-input__field-wrapper">
													<input id="ya-new-mail" class="ya-input__field" type="text" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ya-info-block">
							<div class="ya-info-block__title">
								Изменить пароль
							</div>
							<div class="ya-info-block__content">
								<div class="ya-form">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-3 ya-right">
												<label for="ya-old-pwd" class="ya-input__label">
													Текущий адрес
												</label>
											</div>
											<div class="ya-grid-2-3">
												<div class="ya-input__field-wrapper">
													<input id="ya-old-pwd" class="ya-input__field" type="password" ng-model="cred.old_password" />
												</div>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-3 ya-right">
												<label for="ya-new-pwd" class="ya-input__label">
													Новый пароль
												</label>
											</div>
											<div class="ya-grid-2-3">
												<div class="ya-input__field-wrapper">
													<input id="ya-new-pwd" class="ya-input__field" type="password" ng-model="cred.new_password" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ya-info-block">
							<div class="ya-info-block__title">
								Номер вашего телефона
							</div>
							<div class="ya-info-block__content">
								<div class="ya-form">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-3 ya-right">
												<label for="ya-old-phone" class="ya-input__label">
													Текущий номер
												</label>
											</div>
											<div class="ya-grid-2-3">
												<div class="ya-input__field-wrapper">
													<input id="ya-old-phone" class="ya-input__field" type="tel" />
												</div>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-3 ya-right">
												<label for="ya-new-phone" class="ya-input__label">
													Новый номер
												</label>
											</div>
											<div class="ya-grid-2-3">
												<div class="ya-input__field-wrapper">
													<input id="ya-new-phone" class="ya-input__field" type="tel" ng-model="options.user.phone" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ya-info-block">
							<div class="ya-info-block__content">
								<div class="ya-form">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<label>
													<input type="checkbox" ng-model="options.user.use_large_fonts">
													Использовать увеличенные шрифты
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1 ya-center">
												<button ng-click="user_save();" class="ya-btn ya-btn_secondary ya-btn_inline">Сохранить</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ya-options__info-block" ng-show="active_page === 'privacy'">
						<div class="ya-info-block">
							<div class="ya-info-block__title">
								Моя страница
							</div>
							<div class="ya-info-block__content">
								<div class="ya-form">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-3 ya-right">
												<label for="ya-see-profile" class="ya-input__label">
													Кто видит информацию обо мне
												</label>
											</div>
											<div class="ya-grid-2-3">
												<div class="ya-input__field-wrapper">
													<select id="ya-see-profile" class="ya-input__field ya-input__field_select ya-input__select" >
														<option>Все</option>
														<option>Друзья и друзья друзей</option>
														<option>Только друзья</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ya-info-block">
							<div class="ya-info-block__title">
								Записи на странице
							</div>
							<div class="ya-info-block__content">
								<div class="ya-form">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-3 ya-right">
												<label for="ya-see-comments" class="ya-input__label">
													Кто видит комментарии к записям
												</label>
											</div>
											<div class="ya-grid-2-3">
												<div class="ya-input__field-wrapper">
													<select id="ya-see-comments" class="ya-input__field ya-input__field_select ya-input__select" >
														<option>Все</option>
														<option>Друзья и друзья друзей</option>
														<option>Только друзья</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ya-info-block">
							<div class="ya-info-block__title">
								Связь со мной
							</div>
							<div class="ya-info-block__content">
								<div class="ya-form">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-3 ya-right">
												<label for="ya-can-write" class="ya-input__label">
													Кто может писать мне сообщения
												</label>
											</div>
											<div class="ya-grid-2-3">
												<div class="ya-input__field-wrapper">
													<select id="ya-can-write" class="ya-input__field ya-input__field_select ya-input__select" >
														<option>Все</option>
														<option>Друзья и друзья друзей</option>
														<option>Только друзья</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1 ya-center">
												<button ng-click="user_save();" class="ya-btn ya-btn_secondary ya-btn_inline">Сохранить</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ya-options__info-block" ng-show="active_page === 'notifications'">
						<div class="ya-info-block">
							<div class="ya-info-block__title">
								Моментальные оповещения на сайте
							</div>
							<div class="ya-info-block__content">
								<div class="ya-form">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<label>
													<input
														type="checkbox"
														ng-model="options.user.settings.show_notifications"
														ng-click="options.user.settings.show_notifications && request_permissions();"
													>
													Включить уведомления
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<label>
													<input
														type="checkbox"
														ng-model="options.user.settings.show_notifications_text"
													>
														Показывать текст сообщений
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ya-info-block">
							<div class="ya-info-block__title">
								Оповещение по электронной почте
							</div>
							<div class="ya-info-block__content">
								<div class="ya-form">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<label>
													<input type="checkbox" ng-model="options.user.settings.notify_private">
													Личные сообщения
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<label>
													<input type="checkbox" ng-model="options.user.settings.notify_topic_comments">
													Комментарии на стене
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<label>
													<input type="checkbox" ng-model="options.user.settings.notify_photo_comments">
													Комментарии к фотографиям
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<label>
													<input type="checkbox" ng-model="options.user.settings.notify_video_comments">
													Комментарии к видео
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<label>
													<input type="checkbox" ng-model="options.user.settings.notify_competitions">
													Оповещения о мероприятиях
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<label>
													<input type="checkbox" ng-model="options.user.settings.notify_contests">
													Оповещения о конкурсах
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<label>
													<input type="checkbox" ng-model="options.user.settings.notify_birthdays">
													Дни рождения
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1 ya-center">
												<button ng-click="user_save();" class="ya-btn ya-btn_secondary ya-btn_inline">Сохранить</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ya-grid-1-5">
				<div class="ya-page__block">
					<!--div class="ya-btn ya-btn_search"-->
						<a href="#/search" class="ya-btn__link ya-btn__link_search">Поиск</a>
					<!--/div-->
				</div>
				<div class="ya-page__block ya-page__block_colored">
					<div class="ya-profile-links ya-clearfix">
							<div class="ya-profile-links__link-wrapper ya-inner-grid-1-2">
								<a href="#/dialogs" class="ya-profile-links__link ya-profile-links__link_chat"><span class="ya-profile-links__link-img ya-profile-links__link-img_chat"></span></a>
							</div>
							<div class="ya-profile-links__link-wrapper ya-inner-grid-1-2">
								<a href="#/user/{{user._id}}/photos/all" class="ya-profile-links__link ya-profile-links__link_photos"><span class="ya-profile-links__link-img ya-profile-links__link-img_photos"></span></a>
							</div>
							<div class="ya-profile-links__link-wrapper ya-inner-grid-1-2">
								<a href="#/user/{{user._id}}/videos/all" class="ya-profile-links__link ya-profile-links__link_videos"><span class="ya-profile-links__link-img ya-profile-links__link-img_videos"></span></a>
							</div>
							<div class="ya-profile-links__link-wrapper ya-inner-grid-1-2">
								<a href="#/favs" class="ya-profile-links__link ya-profile-links__link_favs"><span class="ya-profile-links__link-img ya-profile-links__link-img_favs"></span></a>
							</div>
					</div>
				</div>
				<div class="ya-page__block ya-page__block_colored">
					<div class="ya-ads-block">
						<div class="ya-ads-block__list">
							<div class="ya-ads-block__item ya-ads-block__item_count_1">
								<a href="https://yandex.ru" target="_blank" class="ya-ads-block__link">
									<span class="ya-ads-block__media">
										<img src="/images/banner.jpg" class="ya-ads-block__img" />
									</span>
									<span class="ya-ads-block__text">
										<span class="ya-ads-block__title">АтлетикШоп рекомендует!</span>
										<span class="ya-ads-block__content">Современный продукт, очищенный от "вредных" для каждого атлета.</span>
									</span>
								</a>
							</div>
							<div class="ya-ads-block__item ya-ads-block__item_count_2">
								<a href="https://yandex.ru" target="_blank" class="ya-ads-block__link">
									<span class="ya-ads-block__media">
										<img src="/images/banner.jpg" class="ya-ads-block__img" />
									</span>
									<span class="ya-ads-block__text">
										<span class="ya-ads-block__title">АтлетикШоп рекомендует!</span>
										<span class="ya-ads-block__content">Современный продукт, очищенный от "вредных" для каждого атлета.</span>
									</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</article>
