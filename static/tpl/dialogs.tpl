<article class="ya-dialoges ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
	<div class="ya-narrower">
		<div class="ya-row">
			<div class="ya-grid-1-3">
				<a href="#" ng-click="$event.preventDefault();showsidebar = true;" class="ya-sidebar-info__mobile-link ya-center ya-btn ya-btn_primary" ng-show="!showsidebar">
					Параметры поиска
				</a>
				<a href="#" ng-click="$event.preventDefault();showsidebar = null;" class="ya-sidebar-info__mobile-link ya-sidebar-info__mobile-link_active ya-center ya-btn ya-btn_primary" ng-show="!!showsidebar">
					Параметры поиска
				</a>
				<div class="ya-sidebar-info__full-wrap" ng-class="{'ya-sidebar-info__full-wrap_active': !!showsidebar}">
					<div class="ya-dialoges__penpals ya-penpals">
						<h2 class="ya-media-page__title ya-media-page__title_dialogs ya-title ya-relative ya-center">
							Поиск
						</h2>
						<div class="ya-penpals__list">
							<div class="ya-penpals__item ya-clearfix" ng-repeat="d in dialogs track by $index" ng-click="set_messages(d, $index);">
								<div class="ya-grid-1-5">
									<div class="ya-avatar ya-avatar_small ya-wall__avatar">
										<img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
									</div>
								</div>
								<div class="ya-grid-4-5">
									<div class="ya-penpals__title ya-clearfix">
										<div class="ya-penpals__name ya-grid-2-3 ya-left">
											Иванов Иван {{with_user(d)}}
										</div>
										<div class="ya-penpals__date ya-grid-1-3 ya-right">
											21.01.2017
										</div>
									</div>
									<div class="ya-penpals__msg">
										Последнее сообщение от пользователя...
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ya-grid-7-15">
				<h2 class="ya-media-page__title ya-media-page__title_msgs ya-title ya-relative">
					Иванов Иван
				</h2>
				<div class="ya-dialog ya-relative">
					<div class="ya-dialog__content">
						<div class="ya-wall">
							<div class="ya-wall__news">
								<div class="ya-wall__news-list">
									<div class="ya-wall__news-item">
										<div class="ya-wall__news-content">
											<div class="ya-wall__news-text ya-wall__news-text_empty ya-center">
												Пока не добавлено ни одного сообщения.
											</div>
										</div>
									</div>
									<div class="ya-wall__news-item" ng-repeat="m in messages">
										<div class="ya-wall__news-content">
											<div class="ya-wall__news-author ya-relative ya-clearfix">
												<div class="ya-wall__news-remove" ng-if="options.user._id === user._id" ng-click="del_topic($index)">x</div>
												<div class="ya-avatar ya-avatar_small ya-wall__avatar">
													<img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
												</div>
												<div class="ya-wall__news-info ya-clearfix">
													<div class="ya-wall__author-name">
														Иванов Иван
													</div>
													<div class="ya-wall__news-date">
														21.01.2017
													</div>
												</div>
											</div>
											<div class="ya-wall__news-text">
												<pre>{{m.text}}</pre>
											</div>
											<div class="ya-wall__news-media">
												<img ng-src="{{i}}" ng-repeat="i in t.images" class="ya-wall__news-img" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ya-new-post__form">
					<form ng-submit="add_message()" class="ya-form" ng-show="messages.length">
						<div class="ya-form__input ya-input ya-input_inline ya-input_small-pad ya-input_message">
							<div class="ya-clearfix">
								<div class="ya-grid-1-6">
									<div class="ya-avatar ya-avatar_small ya-avatar_message">
										<img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
									</div>
								</div>
								<div class="ya-grid-5-6">
									<div class="ya-input__field-wrapper ya-input__field-wrapper_textarea ya-relative">
										<textarea rows="10" class="ya-input__field ya-input__field_textarea ya-input__field_unbordered ya-input__field_message" ng-model="message" placeholder="Введите сообщение"></textarea>
										<div class="ya-new-post__btns-wrapper">
											<div class="ya-new-post__btn ya-pop-btn ya-pop-btn_adds">
												<div class="ya-pop-btn__pop-up">
													<ul class="ya-pop-btn__list">
														<li class="ya-pop-btn__item">
															<span class="ya-pop-btn__link ya-pop-btn__link_photo" ng-click="gallery.add_image = !gallery.add_image;">Фото</span>
														</li>
														<li class="ya-pop-btn__item">
															<span class="ya-pop-btn__link ya-pop-btn__link_video" ng-click="gallery.add_video = !gallery.add_video;">Видео</span>
														</li>
													</ul>
												</div>
											</div>
											<div class="ya-new-post__btn ya-pop-btn ya-pop-btn_smiles">
												<div class="ya-smiles ya-pop-btn__pop-up">
													Smiles ))
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
					<div>
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
