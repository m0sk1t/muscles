<article class="ya-options ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
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
						<li class="ya-nav-menu__item" ng-click="active_page = 'work_n_study'">
							<span class="ya-nav-menu__link" ng-class="{'ya-nav-menu__link_active': active_page === 'work_n_study'}">Дополнительно<span>
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
												<select ng-click="load_countries();" ng-model="options.user.location_country.id" id="ya-country" class="ya-input__field ya-input__field_select ya-input__select">
													<option value="{{c.cid}}" ng-repeat="c in countries" ng-click="options.user.location_country.title = c.title">{{c.title}}</option>
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
												<select ng-click="load_cities();" ng-model="options.user.location_city.id" id="ya-city" class="ya-input__field ya-input__field_select ya-input__select">
													<option value="{{ct.cid}}" ng-repeat="ct in cities" ng-click="options.user.location_city.title = ct.title">{{ct.title}}</option>
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
												<input id="ya-status" class="ya-input__field" type="text" ng-model="options.user.status" maxlength="40" />
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
													<option value="1">Мужской</option>
													<option value="0">Женский</option>
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
													<option>Русый</option>
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
												<select id="ya-type" class="ya-input__field ya-input__field_select ya-input__select" ng-model="options.user.typage">
													<option>Атлет</option>
													<option>Толстый</option>
													<option>Худощавый</option>
													<option>Упитанный</option>
													<option>Спортивный</option>
													<option>Бодибилдер</option>
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
												<datepicker style="width: 11rem; float: none;" date-format="dd.MM.yyyy">
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
												<input type="checkbox" id="ya-comments_enabled" class="ya-input__field ya-input__field_checkbox" ng-model="options.user.settings.comments_enabled">
												<label for="ya-comments_enabled" class="ya-input__label ya-input__label_checkbox">
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
								Изменить пароль
							</div>
							<div class="ya-info-block__content">
								<div class="ya-form">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-3 ya-right">
												<label for="ya-old-pwd" class="ya-input__label">
													Новый пароль
												</label>
											</div>
											<div class="ya-grid-2-3">
												<div class="ya-input__field-wrapper">
													<input id="ya-old-pwd" class="ya-input__field" type="password" ng-model="cred.password" />
												</div>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-3 ya-right">
												<label for="ya-new-pwd" class="ya-input__label">
													Подтвердите новый пароль
												</label>
											</div>
											<div class="ya-grid-2-3">
												<div class="ya-input__field-wrapper">
													<input id="ya-new-pwd" class="ya-input__field" type="password" ng-model="cred.confirmPassword" />
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
											<div class="ya-grid-1-1 ya-center">
												<button ng-click="changepwd();" class="ya-btn ya-btn_secondary ya-btn_inline">Изменить пароль</button>
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
														<option>Только список избранных</option>
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
														<option>Только список избранных</option>
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
														<option>Только список избранных</option>
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
								Социальные сети
							</div>
							<div class="ya-info-block__content">
								<div class="ya-form">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<div class="ya-input__field-wrapper">
													<label class="ya-input__label ya-input__label_href">
														Facebook
													</label>
													<a ng-show="options.user.tokens.fb" ng-click="unlink('fb')" class="ya-social-linker ya-social-linker_active">Отвязать</a>
													<a ng-hide="options.user.tokens.fb" href="/auth/fb" class="ya-social-linker">Привязать</a> <br>Количество подписчиков: {{options.user.social.fb._json.friends.summary.total_count || 'н\\д'}}
												</div>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<div class="ya-input__field-wrapper">
													<label class="ya-input__label ya-input__label_href">
														VKontakte
													</label>
													<a ng-show="options.user.tokens.vk" ng-click="unlink('vk')" class="ya-social-linker ya-social-linker_active">Отвязать</a>
													<a ng-hide="options.user.tokens.vk" href="/auth/vk" class="ya-social-linker">Привязать</a> <br>Количество подписчиков: {{options.user.social.vk.friends.summary.total_count || 'н\\д'}}
												</div>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<div class="ya-input__field-wrapper">
													<label class="ya-input__label ya-input__label_href">
														Twitter
													</label>
													<a ng-show="options.user.tokens.tw" ng-click="unlink('tw')" class="ya-social-linker ya-social-linker_active">Отвязать</a>
													<a ng-hide="options.user.tokens.tw" href="/auth/tw" class="ya-social-linker">Привязать</a> <br>Количество подписчиков: {{options.user.social.tw._json.friends_count || 'н\\д'}}
												</div>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<div class="ya-input__field-wrapper">
													<label class="ya-input__label ya-input__label_href">
														Instagram
													</label>
													<a ng-show="options.user.tokens.im" ng-click="unlink('im')" class="ya-social-linker ya-social-linker_active">Отвязать</a>
													<a ng-hide="options.user.tokens.im" href="/auth/im" class="ya-social-linker">Привязать</a> <br>Количество подписчиков: {{options.user.social.im._json.data.counts.follows || 'н\\д'}}
												</div>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<div class="ya-input__field-wrapper">
													<label class="ya-input__label ya-input__label_href">
														Odnoklassniki
													</label>
													<a ng-show="options.user.tokens.ok" ng-click="unlink('ok')" class="ya-social-linker ya-social-linker_active">Отвязать</a>
													<a ng-hide="options.user.tokens.ok" href="/auth/ok" class="ya-social-linker">Привязать</a> <br>Количество подписчиков: {{options.user.social.ok._json.friends_count || 'н\\д'}}
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ya-info-block">
							<div class="ya-info-block__title">
							</div>
							<div class="ya-info-block__content">
								<div class="ya-form">
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
												<input id="ya-show_notifications" class="ya-input__field ya-input__field_checkbox" type="checkbox"
														ng-model="options.user.settings.show_notifications">
												<label for="ya-show_notifications" class="ya-input__label ya-input__label_checkbox" ng-click="options.user.settings.show_notifications && request_permissions();">
													Включить уведомления
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<input id="ya-show_notifications_text" class="ya-input__field ya-input__field_checkbox" type="checkbox"
													ng-model="options.user.settings.show_notifications_text">
												<label for="ya-show_notifications_text" class="ya-input__label ya-input__label_checkbox">
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
												<input id="ya-notify_private" class="ya-input__field ya-input__field_checkbox" type="checkbox"
													ng-model="options.user.settings.notify_private">
												<label for="ya-notify_private" class="ya-input__label ya-input__label_checkbox">
													Личные сообщения
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<input id="ya-notify_topic_comments" class="ya-input__field ya-input__field_checkbox" type="checkbox"
													ng-model="options.user.settings.notify_topic_comments">
												<label for="ya-notify_topic_comments" class="ya-input__label ya-input__label_checkbox">
													Комментарии на стене
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<input id="ya-notify_photo_comments" class="ya-input__field ya-input__field_checkbox" type="checkbox"
													ng-model="options.user.settings.notify_photo_comments">
												<label for="ya-notify_photo_comments" class="ya-input__label ya-input__label_checkbox">
													Комментарии к фотографиям
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<input id="ya-notify_video_comments" class="ya-input__field ya-input__field_checkbox" type="checkbox"
													ng-model="options.user.settings.notify_video_comments">
												<label for="ya-notify_video_comments" class="ya-input__label ya-input__label_checkbox">
													Комментарии к видео
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<input id="ya-notify_competitions" class="ya-input__field ya-input__field_checkbox" type="checkbox"
													ng-model="options.user.settings.notify_competitions">
												<label for="ya-notify_competitions" class="ya-input__label ya-input__label_checkbox">
													Оповещения о мероприятиях
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<input id="ya-notify_contests" class="ya-input__field ya-input__field_checkbox" type="checkbox"
													ng-model="options.user.settings.notify_contests">
												<label for="ya-notify_contests" class="ya-input__label ya-input__label_checkbox">
													Оповещения о конкурсах
												</label>
											</div>
										</div>
									</div>
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1">
												<input id="ya-notify_birthdays" class="ya-input__field ya-input__field_checkbox" type="checkbox"
													ng-model="options.user.settings.notify_birthdays">
												<label for="ya-notify_birthdays" class="ya-input__label ya-input__label_checkbox">
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
					<div class="ya-options__info-block" ng-show="active_page === 'work_n_study'">
						<div class="ya-info-block">
							<div class="ya-info-block__title">
								Доп. инфо и предложения
							</div>
							<div class="ya-info-block__content">

							<div class="ya-sidebar-info__content-wrapper" ng-repeat="h in options.user.hobbies track by $index">
								<div class="ya-page__block ya-page__block_full-shadow ya-relative">
									<span class="ya-close-btn" ng-click="rm_hobbie(h, $index)">X</span>
									<div class="ya-sidebar-info__content">
										<div class="ya-sidebar-info__item">
											<span class="ya-sidebar-info__label">{{h.item}}</span> {{h.title}}
										</div>
									</div>
								</div>
							</div>
								<div class="ya-form" ng-show="!hobbie">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1 ya-center">
												<button ng-click="add_hobbie();" class="ya-btn ya-btn_primary ya-btn_inline">Добавить</button>
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form" ng-show="hobbie">
									<form ng-submit="save_hobbie();">
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-ach-country" class="ya-input__label">
														Тип
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<select id="ya-ach-country" ng-model="hobbie.type" class="ya-input__field ya-input__field_select ya-input__select" >
															<option ng-value="{{h.type}}" ng-repeat="h in hobbies" ng-click="hobbie.item = h.item">{{h.item}}</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-ach-comment" class="ya-input__label">
														Что именно?
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<input id="ya-ach-comment" class="ya-input__field" type="text" ng-model="hobbie.title" />
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-1 ya-center">
													<input type="submit" value="Сохранить" class="ya-btn ya-btn_secondary ya-btn_inline" />
													<span ng-click="hobbie = null;" class="ya-btn ya-btn_primary ya-btn_inline">Отменить</span>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>

						<div class="ya-info-block">
							<div class="ya-info-block__title">
								Мои виды спорта
							</div>
							<div class="ya-info-block__content">

							<div class="ya-sidebar-info__content-wrapper" ng-repeat="s in options.user.sports track by $index">
								<div class="ya-page__block ya-page__block_full-shadow ya-relative">
									<span class="ya-close-btn" ng-click="rm_sport(s, $index)">X</span>
									<div class="ya-sidebar-info__content">
										<div class="ya-sidebar-info__item">
											<span class="ya-sidebar-info__label">Вид спорта</span> {{s}}
										</div>
									</div>
								</div>
							</div>
								<div class="ya-form" ng-show="!sport">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1 ya-center">
												<button ng-click="add_sport();" class="ya-btn ya-btn_primary ya-btn_inline">Добавить</button>
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form" ng-show="sport">
									<form ng-submit="save_sport();">
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-ach-country" class="ya-input__label">
														Вид спорта
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<select id="ya-ach-country" ng-model="sport" class="ya-input__field ya-input__field_select ya-input__select" >
															<option ng-value="s.sport" ng-repeat="s in sports" ng-show="options.user.sex == s.sex">{{s.sport}}</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-1 ya-center">
													<input type="submit" value="Сохранить" class="ya-btn ya-btn_secondary ya-btn_inline" />
													<span ng-click="sport = null;" class="ya-btn ya-btn_primary ya-btn_inline">Отменить</span>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>

						<div class="ya-info-block">
							<div class="ya-info-block__title">
								Достижения
							</div>
							<div class="ya-info-block__content">

							<div class="ya-sidebar-info__content-wrapper" ng-repeat="a in options.user.achievements track by $index">
								<div class="ya-page__block ya-page__block_full-shadow ya-relative">
									<span class="ya-close-btn" ng-click="rm_achievement(a, $index)">X</span>
									<div class="ya-sidebar-info__content">
										<div class="ya-sidebar-info__item">
											<span class="ya-sidebar-info__label">Страна</span> {{a.country}}
										</div>
										<div class="ya-sidebar-info__item">
											<span class="ya-sidebar-info__label">Город</span> {{a.city}}
										</div>
										<div class="ya-sidebar-info__item">
											<span class="ya-sidebar-info__label">Год</span> {{a.year}}
										</div>
										<div class="ya-sidebar-info__item">
											<span class="ya-sidebar-info__label">Название</span> {{a.title}}
										</div>
										<div class="ya-sidebar-info__item">
											<span class="ya-sidebar-info__label">Место</span> {{a.place}}
										</div>
										<div class="ya-sidebar-info__item">
											<span class="ya-sidebar-info__label">Комментарии</span> {{a.comment}}
										</div>
									</div>
								</div>
							</div>
								<div class="ya-form" ng-show="!achievement">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1 ya-center">
												<button ng-click="add_achievement();" class="ya-btn ya-btn_primary ya-btn_inline">Добавить</button>
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form" ng-show="achievement">
									<form ng-submit="save_achievement();">
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-ach-country" class="ya-input__label">
														Страна
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<select id="ya-ach-country" ng-model="achievement.country_id" ng-change="load_cities();" class="ya-input__field ya-input__field_select ya-input__select" >
															<option value="{{c.cid}}" ng-repeat="c in countries" ng-click="achievement.country = c.title">{{c.title}}</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-ach-city" class="ya-input__label">
														Город
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<select id="ya-ach-city" ng-model="achievement.city_id" class="ya-input__field ya-input__field_select ya-input__select" >
															<option value="{{ci.cid}}" ng-repeat="ci in cities" ng-click="achievement.city = ci.title">{{ci.title}}</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-ach-year" class="ya-input__label">
														Год
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<input id="ya-ach-year" class="ya-input__field" type="number" ng-model="achievement.year" max="{{achievement.year}}" />
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-ach-title" class="ya-input__label">
														Наименование конкурса
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<input id="ya-ach-title" class="ya-input__field" type="text" ng-model="achievement.title" />
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-ach-place" class="ya-input__label">
														Место
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<input id="ya-ach-place" class="ya-input__field" type="text" ng-model="achievement.place" />
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-ach-comment" class="ya-input__label">
														Комментарий
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<input id="ya-ach-comment" class="ya-input__field" type="text" ng-model="achievement.comment" />
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-1 ya-center">
													<input type="submit" value="Сохранить" class="ya-btn ya-btn_secondary ya-btn_inline" />
													<span ng-click="achievement = null;" class="ya-btn ya-btn_primary ya-btn_inline">Отменить</span>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="ya-info-block">
							<div class="ya-info-block__title">
								Работа
							</div>
							<div class="ya-info-block__content">
								<div class="ya-sidebar-info__content-wrapper" ng-repeat="w in options.user.workplaces track by $index">
									<div class="ya-page__block ya-relative">
										<span class="ya-close-btn" ng-click="rm_workplace(w, $index)">X</span>
										<div class="ya-sidebar-info__content">
											<div class="ya-sidebar-info__item">
												<span class="ya-sidebar-info__label">Страна</span> {{w.country}}
											</div>
											<div class="ya-sidebar-info__item">
												<span class="ya-sidebar-info__label">Город</span> {{w.city}}
											</div>
											<div class="ya-sidebar-info__item">
												<span class="ya-sidebar-info__label">Годы</span> {{w.year_start}} - {{w.year_end||'по н. вр.'}}
											</div>
											<div class="ya-sidebar-info__item">
												<span class="ya-sidebar-info__label">Компания</span> {{w.company}}
											</div>
											<div class="ya-sidebar-info__item">
												<span class="ya-sidebar-info__label">Должность</span> {{w.speciality}}
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form" ng-show="!workplace">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1 ya-center">
												<button ng-click="add_workplace();" class="ya-btn ya-btn_primary ya-btn_inline">Добавить</button>
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form" ng-show="workplace">
									<form ng-submit="save_workplace();">
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-wp-country" class="ya-input__label">
														Страна
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<select id="ya-wp-country" ng-model="workplace.country_id" ng-change="load_cities();" class="ya-input__field ya-input__field_select ya-input__select" >
															<option value="{{c.cid}}" ng-repeat="c in countries" ng-click="workplace.country = c.title">{{c.title}}</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-wp-city" class="ya-input__label">
														Город
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<select id="ya-wp-city" ng-model="workplace.city_id" class="ya-input__field ya-input__field_select ya-input__select" >
															<option value="{{ci.cid}}" ng-repeat="ci in cities" ng-click="workplace.city = ci.title">{{ci.title}}</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-wp-year-start" class="ya-input__label">
														С
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<input id="ya-wp-year-start" class="ya-input__field" type="number" ng-model="workplace.year_start" max="{{currentYear}}" />
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-wp-year-finish" class="ya-input__label">
														По
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<input id="ya-wp-year-finish" class="ya-input__field" type="number" ng-model="workplace.year_end" max="{{currentYear}}" />
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-wp-company" class="ya-input__label">
														Компания
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<input id="ya-wp-company" class="ya-input__field" type="text" ng-model="workplace.company" />
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-wp-spec" class="ya-input__label">
														Специальность
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<input id="ya-wp-spec" class="ya-input__field" type="text" ng-model="workplace.speciality" />
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-1 ya-center">
													<input type="submit" value="Сохранить" class="ya-btn ya-btn_secondary ya-btn_inline" />
													<span ng-click="workplace = null;" class="ya-btn ya-btn_primary ya-btn_inline">Отменить</span>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="ya-info-block">
							<div class="ya-info-block__title">
								Образование
							</div>
							<div class="ya-info-block__content">
								<div class="ya-sidebar-info__content-wrapper" ng-repeat="u in options.user.universities track by $index">
									<div class="ya-page__block ya-relative">
										<span class="ya-close-btn" ng-click="rm_university(u, $index)">X</span>
										<div class="ya-sidebar-info__content">
											<div class="ya-sidebar-info__item">
												<span class="ya-sidebar-info__label">Страна</span> {{u.country}}
											</div>
											<div class="ya-sidebar-info__item">
												<span class="ya-sidebar-info__label">Город</span> {{u.city}}
											</div>
											<div class="ya-sidebar-info__item">
												<span class="ya-sidebar-info__label">Годы</span> {{u.year_start}} - {{u.year_end||'по н. вр.'}}
											</div>
											<div class="ya-sidebar-info__item">
												<span class="ya-sidebar-info__label">Учреждение</span> {{u.university}}
											</div>
											<div class="ya-sidebar-info__item">
												<span class="ya-sidebar-info__label">Факультет</span> {{u.faculty}}
											</div>
											<div class="ya-sidebar-info__item">
												<span class="ya-sidebar-info__label">Кафедра</span> {{u.chair}}
											</div>
											<div class="ya-sidebar-info__item">
												<span class="ya-sidebar-info__label">Специальность</span> {{u.speciality}}
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form" ng-show="!workplace">
									<div class="ya-form__input ya-input ya-input_inline">
										<div class="ya-clearfix">
											<div class="ya-grid-1-1 ya-center">
												<button ng-click="add_university();" class="ya-btn ya-btn_primary ya-btn_inline">Добавить</button>
											</div>
										</div>
									</div>
								</div>
								<div class="ya-form" ng-show="university">
									<form ng-submit="save_university();">
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-university-country" class="ya-input__label">
														Страна
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<select id="ya-university-country" ng-model="university.country_id" ng-change="load_cities();" class="ya-input__field ya-input__field_select ya-input__select" >
															<option value="{{c.cid}}" ng-repeat="c in countries" ng-click="university.country = c.title">{{c.title}}</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-university-city" class="ya-input__label">
														Город
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<select id="ya-university-city" ng-model="university.city_id" ng-change="load_universities();" class="ya-input__field ya-input__field_select ya-input__select" >
															<option value="{{ci.cid}}" ng-repeat="ci in cities" ng-click="university.city = ci.title">{{ci.title}}</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-university-university" class="ya-input__label">
														ВУЗ
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<select id="ya-university-university" ng-model="university.university_id" ng-change="load_faculties()" class="ya-input__field ya-input__field_select ya-input__select" >
															<option value="{{u.id}}" ng-repeat="u in universities" ng-click="university.university = u.title">{{u.title}}</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-university-faculty" class="ya-input__label">
														Факультет
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<select id="ya-university-faculty" ng-model="university.faculty_id" ng-change="load_chairs()" class="ya-input__field ya-input__field_select ya-input__select" >
															<option value="{{f.id}}" ng-repeat="f in faculties" ng-click="university.faculty = f.title">{{f.title}}</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-university-chair" class="ya-input__label">
														Кафедра
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<select id="ya-university-chair" ng-model="university.chair_id" class="ya-input__field ya-input__field_select ya-input__select" >
															<option value="{{ch.id}}" ng-repeat="ch in chairs" ng-click="university.chair = ch.title">{{ch.title}}</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-university-year-start" class="ya-input__label">
														С
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<input id="ya-university-year-start" class="ya-input__field" type="number" ng-model="university.year_start" max="{{currentYear}}" />
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-university-year-finish" class="ya-input__label">
														По
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<input id="ya-university-year-finish" class="ya-input__field" type="number" ng-model="university.year_end" max="{{currentYear}}" />
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-3 ya-right">
													<label for="ya-university-spec" class="ya-input__label">
														Специальность
													</label>
												</div>
												<div class="ya-grid-2-3">
													<div class="ya-input__field-wrapper">
														<input id="ya-university-spec" class="ya-input__field" type="text" ng-model="university.speciality" />
													</div>
												</div>
											</div>
										</div>
										<div class="ya-form__input ya-input ya-input_inline">
											<div class="ya-clearfix">
												<div class="ya-grid-1-1 ya-center">
													<input type="submit" value="Сохранить" class="ya-btn ya-btn_secondary ya-btn_inline" />
													<span ng-click="university = null;" class="ya-btn ya-btn_primary ya-btn_inline">Отменить</span>
												</div>
											</div>
										</div>
									</form>
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
				<div class="ya-profile-links_head">
					<a href="#" ng-click="$event.preventDefault();showTopMenu = true;" class="ya-sidebar-info__mobile-link ya-center ya-btn ya-btn_primary" ng-show="!showTopMenu">
							Меню
					</a>
					<a href="#" ng-click="$event.preventDefault();showTopMenu = null;" class="ya-sidebar-info__mobile-link ya-sidebar-info__mobile-link_active ya-center ya-btn ya-btn_primary" ng-show="!!showTopMenu">
						Меню
					</a>
					<div class="ya-page__block ya-profile-links ya-page__block_colored" ng-class="{'ya-profile-links_active': !!showTopMenu}">
						<div class="ya-clearfix">
							<div class="ya-clearfix ">
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
