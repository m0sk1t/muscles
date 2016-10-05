<article class="ya-user ya-container">
	<div class="ya-narrower">
		<div class="ya-row">
			<div class="ya-grid-1-3">
				<div class="ya-page__block ya-page__block_colored">
					<div class="ya-user__main-info ya-relative">
						<span
							class="ya-online-id ya-online-id_large ya-online-id_main"
							ng-class="{'ya-online-id_online_yes': user.online,'ya-online-id_online_no': !user.online}"
						>
						</span>
						<div class="ya-user__avatar ya-avatar ya-avatar_large">
							<a class="ya-avatar__link" href="#/options">
								<img class="ya-avatar__img" ng-src="{{user.avatar || '/images/avatar.jpg'}}" alt="{{user.name}} {{user.surname}}">
							</a>
						</div>
						<div class="ya-user__name">
							{{user.name}} {{user.surname}}, {{get_age(user.birthDate)}}
						</div>
						<div class="ya-user__city">
							{{user.city}} Иваново
						</div>
					</div>
					<div class="ya-user__config-block ya-clearfix">
						<div class="ya-span-2-3">
							<div class="ya-user__raiting ya-raiting">
								<span class="ya-raiting__star ya-raiting__star_full"></span>
								<span class="ya-raiting__star ya-raiting__star_full"></span>
								<span class="ya-raiting__star ya-raiting__star_full"></span>
								<span class="ya-raiting__star ya-raiting__star_half"></span>
								<span class="ya-raiting__star ya-raiting__star_empty"></span>
							</div>
						</div>
						<div class="ya-user__options ya ya-span-1-3">
							<a href="#/options" class="ya-user__options-btn" ng-if="options.user._id === user._id"></a>
							<a href="#" class="ya-user__logout-btn ya-logout-btn"></a>
						</div>
					</div>
				</div>
				<div ng-if="options.user._id !== user._id" class="actions">
					<span ng-class="{fav: in_fav()}" ng-click="fav();">&#9825;</span>
					<button ng-click="write_message();">Написать сообщение</button>
				</div>
				<div class="ya-user__sports ya-sidebar-info ya-relative">
					<div class="ya-sidebar-info__icon ya-sidebar-info__icon_sports"></div>
					<div class="ya-page__block ya-page__block_rounded">
						<h2 class="ya-sidebar-info__title">
							Виды спорта
						</h2>
						<div class="ya-sidebar-info__content-wrapper">
							<div class="ya-sidebar-info__content">
								<div class="ya-sidebar-info__item">
									Классический бодибилдинг
								</div>
								<div class="ya-sidebar-info__item">
									Кроссфит
								</div>
								<div class="ya-sidebar-info__item">
									Фитнесс
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ya-user__awards ya-sidebar-info ya-relative">
					<div class="ya-sidebar-info__icon ya-sidebar-info__icon_awards" ng-click="add_achievement();"></div>
					<div class="ya-page__block ya-page__block_rounded">
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
					</div>
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
				<div class="ya-user__work ya-sidebar-info ya-relative">
					<div class="ya-sidebar-info__icon ya-sidebar-info__icon_work" ng-click="options.user._id === user._id && add_workplace();"></div>
					<div class="ya-page__block ya-page__block_rounded">
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
					</div>
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
				<div class="ya-user__edu ya-sidebar-info ya-relative">
					<div class="ya-sidebar-info__icon ya-sidebar-info__icon_edu" ng-click="options.user._id === user._id && add_university();"></div>
					<div class="ya-page__block ya-page__block_rounded">
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
					</div>
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
			</div>
			<div class="ya-grid-7-15">
				<div class="ya-page__block ya-page__block_bordered ya-user__text-info">
					<div class="ya-user__info-block ya-info-block ya-info-block_border_no">
						<div class="ya-clearfix ya-user__status-line">
							<div class="ya-user__status ya-grid-1-2">{{user.status}}</div>
							<div class="ya-user__status ya-grid-1-2">Заходил {{last_seen()}}</div>
						</div>
					</div>
					<div class="ya-user__info-block">
						<div class="ya-info-block">
							<h2 class="ya-info-block__title ya-info-block__title_data">Данные спортсмена</h2>
							<div class="ya-info-block__content ya-clearfix">
								<div class="ya-inner-grid-1-2">
									<div class="ya-info-block__record ya-clearfix">
										<div class="ya-info-block__label ya-span-1-2">Возраст:</div>
										<div class="ya-info-block__value ya-span-1-2">{{get_age(user.birthDate)}}</div>
									</div>
									<div class="ya-info-block__record ya-clearfix">
										<div class="ya-info-block__label ya-span-1-2">Рост:</div>
										<div class="ya-info-block__value ya-span-1-2">{{user.height}}</div>
									</div>
									<div class="ya-info-block__record ya-clearfix">
										<div class="ya-info-block__label ya-span-1-2">Вес:</div>
										<div class="ya-info-block__value ya-span-1-2">{{user.weight}}</div>
									</div>
									<div class="ya-info-block__record ya-clearfix">
										<div class="ya-info-block__label ya-span-1-2">Цвет волос:</div>
										<div class="ya-info-block__value ya-span-1-2">{{user.hairs}}</div>
									</div>
								</div>
								<div class="ya-inner-grid-1-2">
									<div class="ya-info-block__record ya-clearfix">
										<div class="ya-info-block__label ya-span-1-2">Грудь:</div>
										<div class="ya-info-block__value ya-span-1-2">{{user.chest}}</div>
									</div>
									<div class="ya-info-block__record ya-clearfix">
										<div class="ya-info-block__label ya-span-1-2">Талия:</div>
										<div class="ya-info-block__value ya-span-1-2">{{user.waist}}</div>
									</div>
									<div class="ya-info-block__record ya-clearfix">
										<div class="ya-info-block__label ya-span-1-2">Бедра:</div>
										<div class="ya-info-block__value ya-span-1-2">{{user.huckle}}</div>
									</div>
									<div class="ya-info-block__record ya-clearfix">
										<div class="ya-info-block__label ya-span-1-2">Телосложение:</div>
										<div class="ya-info-block__value ya-span-1-2">{{user.type}}</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ya-user__info-block">
						<div class="ya-info-block">
							<h2 class="ya-info-block__title ya-info-block__title_add">Доп.информация</h2>
							<div class="ya-info-block__content">
								<div class="ya-info-block__record ya-clearfix">
									<div class="ya-info-block__label ya-inner-grid-1-4">Предлагаю</div>
									<div class="ya-info-block__value ya-inner-grid-3-4">Услуги фотографа</div>
								</div>
								<div class="ya-info-block__record ya-clearfix">
									<div class="ya-info-block__label ya-inner-grid-1-4">Продаю</div>
									<div class="ya-info-block__value ya-inner-grid-3-4">Спортпит+</div>
								</div>
								<div class="ya-info-block__record ya-clearfix">
									<div class="ya-info-block__label ya-inner-grid-1-4">Предлагаю</div>
									<div class="ya-info-block__value ya-inner-grid-3-4">Одежду для фитнесса</div>
								</div>
								<div class="ya-info-block__record ya-clearfix">
									<div class="ya-info-block__label ya-inner-grid-1-4">Спонсор</div>
									<div class="ya-info-block__value ya-inner-grid-3-4">Ищу спонсора</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ya-user__info-block">
						<div class="ya-info-block">
							<h2 class="ya-info-block__title ya-info-block__title_work">Работа</h2>
							<div class="ya-info-block__content">
								<div class="ya-info-block__record ya-clearfix">
									<div class="ya-info-block__label ya-inner-grid-1-4">Требуется</div>
									<div class="ya-info-block__value ya-inner-grid-3-4">Фитнесс Тренер</div>
								</div>
								<div class="ya-info-block__record ya-clearfix">
									<div class="ya-info-block__label ya-inner-grid-1-4">Куда</div>
									<div class="ya-info-block__value ya-inner-grid-3-4">Боксерский клуб "Rocky"</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ya-user__info-block">
						<div class="ya-info-block">
							<h2 class="ya-info-block__title ya-info-block__title_subscribers">Подписчики</h2>
							<div class="ya-info-block__content">
								<div class="ya-socials ya-socials_inline ya-socials_theme_white">
									<div class="ya-socials__list">
										<div class="ya-socials__item ya-clearfix">
											<span class="ya-socials__link ya-socials__link_profile ya-socials__link_vk">
												<span class="ya-socials__logo ya-socials__logo_vk" ng-click="my_vk_friends();"></span>
											</span>
											<span class="ya-socials__link ya-socials__link_friends">{{options.user.social.vk_subscribers}}</span>
										</div>
										<div class="ya-socials__item ya-clearfix">
											<span href="" class="ya-socials__link ya-socials__link_profile ya-socials__link_fb">
												<span class="ya-socials__logo ya-socials__logo_fb" ng-click="my_facebook_friends();"></span>
											</span>
											<span class="ya-socials__link ya-socials__link_friends">{{options.user.social.fb_subscribers}}</span>
										</div>
										<div class="ya-socials__item ya-clearfix">
											<a href="https://vk.com" target="_blank" class="ya-socials__link ya-socials__link_profile ya-socials__link_tw">
												<span class="ya-socials__logo ya-socials__logo_tw"></span>
											</a>
											<a href="https://vk.com" target="_blank" class="ya-socials__link ya-socials__link_friends">124</a>
										</div>
										<div class="ya-socials__item ya-clearfix">
											<a href="https://vk.com" target="_blank" class="ya-socials__link ya-socials__link_profile ya-socials__link_ok">
												<span class="ya-socials__logo ya-socials__logo_ok"></span>
											</a>
											<a href="https://vk.com" target="_blank" class="ya-socials__link ya-socials__link_friends">2321</a>
										</div>
										<div class="ya-socials__item ya-clearfix">
											<a href="https://vk.com" target="_blank" class="ya-socials__link ya-socials__link_profile ya-socials__link_ig">
												<span class="ya-socials__logo ya-socials__logo_ig"></span>
											</a>
											<a href="https://vk.com" target="_blank" class="ya-socials__link ya-socials__link_friends">459</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="ya-page__block ya-user__photos">
					<div class="ya-photos ya-photos_profile">
						<h2 class="ya-photos__title"><a href="#/user/{{user._id}}/photos/all" class="ya-photos__link">Фото</a></h2>
						<div class="ya-photos__list ya-clearfix">
							<div class="ya-photos__item ya-grid-1-4">
								<div class="ya-photos__wrapper">
									<div class="ya-photos__img" ng-click="set_current(0);" ng-style="{'background-image':'url(' + photos[0].image + ')'}"></div>
								</div>
							</div>
							<div class="ya-photos__item ya-grid-1-4">
								<div class="ya-photos__wrapper">
									<div class="ya-photos__img" ng-click="set_current(1);" ng-style="{'background-image':'url(' + photos[1].image + ')'}"></div>
								</div>
							</div>
							<div class="ya-photos__item ya-grid-1-4">
								<div class="ya-photos__wrapper">
									<div class="ya-photos__img" ng-click="set_current(2);" ng-style="{'background-image':'url(' + photos[2].image + ')'}"></div>
								</div>
							</div>
							<div class="ya-photos__item ya-grid-1-4">
								<div class="ya-photos__wrapper">
									<div class="ya-photos__img" ng-click="set_current(3);" ng-style="{'background-image':'url(' + photos[3].image + ')'}"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div
					class="create"
					ng-click="add_topic()"
					ng-if="options.user._id === user._id"
				>
					Добавить новость
				</div>
				<section>
					<div ng-show="topic">
						<div class="create" ng-click="topic = null">Отменить</div>
						<textarea rows="10" ng-model="topic.text" style="width: 100%;"></textarea>
						<div class="create" ng-click="gallery.add_image = !gallery.add_image;">Добавить картинки</div>
						<div class="create" ng-click="gallery.add_video = !gallery.add_video;">Добавить видеозаписи</div>
						<div class="photos">
							<span ng-repeat="i in topic.images">
								<img ng-src="{{i}}" alt="">
								<span ng-click="add_image_to_topic(i);">del</span>
							</span>
						</div>
						<div class="photos">
							<span ng-repeat="v in topic.videos">
								<img ng-src="{{v.thumbnail}}" alt="">
								<span ng-click="add_video_to_topic(v);">del</span>
							</span>
						</div>
						<div class="create" ng-click="new_topic();">Сохранить запись</div>
					</div>
				</section>
				<div class="ya-page__block ya-page__block_bordered ya-user__wall">
					<div class="ya-wall">
						<h2 class="ya-wall__title">Мои объявления</h2>
						<div class="ya-wall__news">
							<div class="ya-wall__news-list">
								<div class="ya-wall__news-item" ng-repeat="t in topics track by $index">
									<div class="ya-wall__news-content">
										<div class="ya-wall__news-author ya-clearfix">
											<div ng-click="del_topic($index)">x</div>
											<div class="ya-avatar ya-avatar_small ya-wall__avatar">
												<img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
											</div>
											<div class="ya-wall__news-info">
												<div class="ya-wall__author-name">
													{{user.name}} {{user.surname}}
												</div>
												<div class="ya-wall__news-date">
													{{birth_date(t.creDate)}}
												</div>
											</div>
										</div>
										<div class="ya-wall__news-text">
											{{t.text}}
										</div>
										<div class="ya-wall__news-media">
											<img ng-src="{{i}}" ng-repeat="i in t.images" class="ya-wall__news-img" />
										</div>
									</div>
									<div class="ya-wall__news-comments">
										<div class="ya-walls__comments">
											<div class="ya-comments">
												<div class="ya-comments__list">
													<div class="ya-comments__item" ng-repeat="c in t.comments">
														<div class="ya-wall__news-author ya-clearfix">
															<div ng-click="remove_topic_comment($index, c.comment)">x</div>
															<div class="ya-avatar ya-avatar_small ya-wall__avatar">
																<img ng-src="{{c.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
															</div>
															<div class="ya-wall__news-info">
																<div class="ya-wall__author-name">
																	{{c.name}} {{c.surname}}
																</div>
																<div class="ya-wall__news-date">
																	{{birth_date(c.date)}}
																</div>
															</div>
														</div>
														<div class="ya-wall__news-text">
															{{c.comment}}
														</div>
													</div>
												</div>
												<form
													ng-if="user.comments_enabled"
													ng-submit="add_topic_comment($index)"
													class="ya-comments__add-form ya-input"
												>
													<input
														type="text"
														ng-model="topic.comment"
														placeholder="Комментировать"
														class="ya-comments__add-field ya-input__field"
													>
												</form>
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
		<div ng-show="gallery.add_image">
			<div class="ya-pop-up ya-pop-up_active">
				<div class="ya-pop-up__wrapper">
					<div class="ya-pop-up__content">
						<div ng-click="gallery.add_image = null;">close</div>
						<div
							class="drop-box"
							ngf-multiple="true"
							ngf-pattern="'image/*'"
							ngf-drop="upload_files($files)"
							ngf-drag-over-class="'dragover'"
							ngf-select="upload_files($files)"
							ng-if="options.user._id === user._id"
						>
							Бросьте сюда картинки либо кликните
						</div>
						Или выбрать существующие
						<div class="photos">
							<img ng-src="{{p.image}}" alt="" ng-repeat="p in photos" ng-click="add_to_topic(p.image);">
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
		<section tabindex="0" ng-hide="gallery.current === null" ng-keypress="escape_pressed($event) && (gallery.current = null);">
			<div class="photo-area">
				<span
					class="left"
					ng-click="turn_left();"
				>
					&lt;
				</span>
				<span class="photo">
					<span ng-click="set_current(null)">X</span>
					<img ng-src="{{photos[gallery.current].image}}" ng-click="turn_right()">
					<span>
						<div>
							<div class="comment" ng-repeat="c in photos[gallery.current].comments">
								<a href="#/user/{{c.userid}}">{{c.name + ' ' + c.surname}}</a>:
								{{c.comment}}
								<i
									class="fa fa-lg fa-close"
									ng-if="c.userid === options.user._id"
									ng-click="remove_comment(gallery.current, c.comment)"
								></i>
							</div>
						</div>
					</span>
				</span>
			</div>
			<div ng-hide="gallery.current === null">
				<div class="ya-pop-up ya-pop-up_active">
					<div class="ya-pop-up__wrapper">
						<div class="ya-pop-up__content">
							<div class="photo-area">
								<span
									class="left"
									ng-click="turn_left();"
								>
									&lt;
								</span>
								<span class="photo">
									<span ng-click="set_current(null)">X</span>
									<img ng-src="{{photos[gallery.current].image}}" ng-click="turn_right()">
									<span>
										<div>
											<div class="comment" ng-repeat="c in photos[gallery.current].comments">
												<a href="#/user/{{c.userid}}">{{c.name + ' ' + c.surname}}</a>:
												{{c.comment}}
												<i
													class="fa fa-lg fa-close"
													ng-if="c.userid === options.user._id"
													ng-click="remove_comment(gallery.current, c.comment)"
												></i>
											</div>
										</div>
										<input type="text" ng-model="gallery.comment">
										<button ng-click="add_comment(gallery.current)">&gt;</button>
									</span>
								</span>
								<span
									class="right"
									ng-click="turn_right()"
								>
									&gt;
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</article>
