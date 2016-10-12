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

								<button ng-click="user_save();">save</button>
							</div>
						</div>
					</div>
					<section ng-show="active_page === 'common'">
						<label>
							<input type="checkbox" ng-model="options.user.comments_enabled">
							Включить комментарии к записям
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
<!-- 						<label>
							<input type="checkbox" ng-model="options.user.use_large_fonts">
							Использовать увеличенные шрифты
						</label><br>
 -->						<button ng-click="user_save();">save</button>
					</section>
					<section ng-show="active_page === 'privacy'">
						<h3>Моя страница</h3>
						<label>
							Кто видит информацию обо мне
							<select>
								<option>Все</option>
								<option>Только друзья</option>
							</select>
						</label><br>
						<h3>Записи на странице</h3>
						<label>
							<select>
								<option>Все</option>
								<option>Только друзья</option>
							</select>
						</label><br>
						<h3>Связь со мной</h3>
						<label>
							<select>
								<option>Все</option>
								<option>Только друзья</option>
							</select>
						</label><br>
						<div>
							<div>
								FB
								<a ng-show="options.user.tokens.fb" ng-click="unlink('fb')">отвязать</a>
								<a ng-hide="options.user.tokens.fb" href="/auth/fb">привязать</a>
							</div>
							<div>
								VK
								<a ng-show="options.user.tokens.vk" ng-click="unlink('vk')">отвязать</a>
								<a ng-hide="options.user.tokens.vk" href="/auth/vk">привязать</a>
							</div>
							<div>
								TW
								<a ng-show="options.user.tokens.tw" ng-click="unlink('tw')">отвязать</a>
								<a ng-hide="options.user.tokens.tw" href="/auth/tw">привязать</a>
							</div>
							<div>
								IM
								<a ng-show="options.user.tokens.im" ng-click="unlink('im')">отвязать</a>
								<a ng-hide="options.user.tokens.im" href="/auth/im">привязать</a>
							</div>
							<div>
								OK
								<a ng-show="options.user.tokens.ok" ng-click="unlink('ok')">отвязать</a>
								<a ng-hide="options.user.tokens.ok" href="/auth/ok">привязать</a>
							</div>
						</div>
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
					<section ng-show="active_page === 'work_n_study'">
						<div class="achievements_area">
							<h2 class="ya-sidebar-info__title">
								Достижения
							</h2>
							<div class="ya-sidebar-info__content-wrapper" ng-repeat="a in user.achievements track by $index">
								<div
									ng-click="rm_achievement(a, $index)"
									ng-if="options.user._id === user._id"
								>x</div>
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
							<div ng-click="add_achievement();">Добавить</div>
							<div class="add-achievement" ng-show="achievement">
								<div ng-click="achievement = null;">x</div>
								<form ng-submit="save_achievement();">
									<select ng-model="achievement.country_id" ng-change="load_cities();">
										<option value="{{c.cid}}" ng-repeat="c in countries" ng-click="achievement.country = c.title">{{c.title}}</option>
									</select><br />
									<select ng-model="achievement.city_id">
										<option value="{{ci.cid}}" ng-repeat="ci in cities" ng-click="achievement.city = ci.title">{{ci.title}}</option>
									</select><br />
									<input type="number" ng-model="achievement.year" /><br />
									<input type="text" ng-model="achievement.title" placeholder="Наименование конкурса" /><br />
									<input type="text" ng-model="achievement.place" placeholder="Место" /><br/ >
									<input type="text" ng-model="achievement.comment" placeholder="Комментарий" /><br/>
									<input type="submit" value="save" />
								</form>
							</div>
						</div>
						<div class="work_area">
							<h2 class="ya-sidebar-info__title">
								Работа
							</h2>
							<div class="ya-sidebar-info__content-wrapper" ng-repeat="w in user.workplaces track by $index">
								<div
									ng-click="rm_workplace(w, $index)"
									ng-if="options.user._id === user._id"
								>x</div>
								<div class="ya-sidebar-info__content">
									<div class="ya-sidebar-info__item">
										<span class="ya-sidebar-info__label">Страна</span> {{w.country}}
									</div>
									<div class="ya-sidebar-info__item">
										<span class="ya-sidebar-info__label">Город</span> {{w.city}}
									</div>
									<div class="ya-sidebar-info__item">
										<span class="ya-sidebar-info__label">Годы</span> {{w.year_start}} - {{w.year_end}}
									</div>
									<div class="ya-sidebar-info__item">
										<span class="ya-sidebar-info__label">Компания</span> {{w.company}}
									</div>
									<div class="ya-sidebar-info__item">
										<span class="ya-sidebar-info__label">Должность</span> {{w.speciality}}
									</div>
								</div>
							</div>
							<div ng-click="options.user._id === user._id && add_workplace();">Добавить</div>
							<div class="add-work" ng-show="workplace">
								<div ng-click="workplace = null;">x</div>
								<form ng-submit="save_workplace();">
									<select ng-model="workplace.country_id" ng-change="load_cities();">
										<option value="{{c.cid}}" ng-repeat="c in countries" ng-click="workplace.country = c.title">{{c.title}}</option>
									</select><br />
									<select ng-model="workplace.city_id">
										<option value="{{ci.cid}}" ng-repeat="ci in cities" ng-click="workplace.city = ci.title">{{ci.title}}</option>
									</select><br />
									с: <input type="number" ng-model="workplace.year_start" /><br />
									по:<input type="number" ng-model="workplace.year_end" /><br />
									<input type="text" ng-model="workplace.company" placeholder="Компания" />
									<input type="text" ng-model="workplace.speciality" placeholder="Специальность" />
									<input type="submit" value="save" />
								</form>
							</div>
						</div>
						<div class="study">
							<h2 class="ya-sidebar-info__title">
								Образование
							</h2>
							<div class="ya-sidebar-info__content-wrapper" ng-repeat="u in user.universities track by $index">
								<div
									ng-click="rm_university(u, $index)"
									ng-if="options.user._id === user._id"
									>x</div>
								<div class="ya-sidebar-info__content">
									<div class="ya-sidebar-info__item">
										<span class="ya-sidebar-info__label">Страна</span> {{u.country}}
									</div>
									<div class="ya-sidebar-info__item">
										<span class="ya-sidebar-info__label">Город</span> {{u.city}}
									</div>
									<div class="ya-sidebar-info__item">
										<span class="ya-sidebar-info__label">Годы</span> {{u.year_start}} - {{u.year_end}}
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
							<div ng-click="options.user._id === user._id && add_university();">Добавить</div>
							<div class="add-university" ng-show="university">
								<div ng-click="university = null;">x</div>
								<form ng-submit="save_university();">
									<select ng-model="university.country_id" ng-change="load_cities();">
										<option value="{{c.cid}}" ng-repeat="c in countries" ng-click="university.country = c.title">{{c.title}}</option>
									</select><br />
									<select ng-model="university.city_id" ng-change="load_universities();">
										<option value="{{ci.cid}}" ng-repeat="ci in cities" ng-click="university.city = ci.title">{{ci.title}}</option>
									</select><br />
									<select ng-model="university.university_id" ng-change="load_faculties()">
										<option value="{{u.id}}" ng-repeat="u in universities" ng-click="university.university = u.title">{{u.title}}</option>
									</select><br />
									<select ng-model="university.faculty_id" ng-change="load_chairs()">
										<option value="{{f.id}}" ng-repeat="f in faculties" ng-click="university.faculty = f.title">{{f.title}}</option>
									</select><br />
									<select ng-model="university.chair_id">
										<option value="{{ch.id}}" ng-repeat="ch in chairs" ng-click="university.chair = ch.title">{{ch.title}}</option>
									</select><br />
									с: <input type="number" ng-model="university.year_start" /><br />
									по:<input type="number" ng-model="university.year_end" /><br />
									<input type="text" ng-model="university.speciality" placeholder="специальность"><br />
									<input type="submit" value="save" />
								</form>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</article>
