<article class="ya-photos-page ya-media-page ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
	<div class="ya-narrower">
		<div class="ya-row">
			<div class="ya-grid-4-5">
				<div class="ya-albums">
					<h2 class="ya-media-page__title ya-title ya-relative">
						{{options.user._id === options.userid?'Мои фотоальбомы':'Фотоальбомы пользователя'}}
						<span class="ya-albums__create-btn" ng-click="create_album()" ng-if="options.user._id === options.userid">
						</span>
					</h2>
					<div class="ya-photos ya-photos_profile">
						<div class="ya-photos__list ya-photos__list_empty" ng-show="!albums || !albums.length">
							Пока не добавлено ни одной фотографии
						</div>
						<div class="ya-photos__list ya-clearfix" ng-show="albums && albums.length">
							<div class="ya-photos__item ya-photos__item_large ya-inner-grid-1-4" ng-repeat="a in albums">
								<div class="ya-photos__wrapper">
									<a href="#/user/{{options.userid}}/album/{{a._id}}" class="ya-photos__img ya-photos__img_large" ng-style="{'background-image':'url(' + (a.cover.image || '/images/avatar.jpg') + ')'}"></a>
									<a href="#/user/{{options.userid}}/album/{{a._id}}" class="ya-photos__img-title" >{{::a.title}}</a>
									<div class="ya-photos__actions">
										<span
											class="ya-photos__action-btn fa fa-edit"
											ng-click="layer.editedAlbum = a"
											ng-if="options.user._id === a.owner"
										></span>
										<span
											class="ya-photos__action-btn fa fa-close"
											ng-click="delete_album(a._id)"
											ng-if="options.user._id === a.owner"
										></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ya-media-page__gallery">
					<h2 class="ya-media-page__title ya-relative">
						{{options.user._id === options.userid?'Мои фотографии':'Фотографии пользователя'}}
						<span
							class="ya-albums__create-btn"
							ngf-multiple="true"
							ngf-pattern="'image/*'"
							ngf-drop="upload_files($files)"
							ngf-drag-over-class="'dragover'"
							ngf-select="upload_files($files)"
							ng-if="options.user._id === options.userid"
						>						</span>
					</h2>
					<div class="ya-photos ya-photos_profile">
						<div class="ya-photos__list ya-photos__list_empty" ng-show="!photos || !photos.length">
							Пока не добавлено ни одной фотографии
						</div>
						<div class="ya-photos__list ya-clearfix" ng-show="photos && photos.length">
							<div class="ya-photos__item ya-photos__item_large ya-inner-grid-1-4" ng-repeat="p in photos track by $index">
								<div class="ya-photos__wrapper">
									<div class="ya-photos__img ya-photos__img_large" ng-click="gallery.current = $index" ng-style="{'background-image':'url(' + p.image + ')'}"></div>
									<div class="ya-photos__actions">
										<span
											class="ya-photos__action-btn fa fa-edit"
											ng-click="layer.editedPhoto = p;"
											ng-if="options.user._id === p.owner"
										></span>
										<span
											class="ya-photos__action-btn fa fa-close"
											ng-click="delete_photo(p._id)"
											ng-if="options.user._id === p.owner"
										></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ya-pop-up ya-pop-up_small ya-pop-up_active" ng-hide="layer.editedPhoto == null" ng-click="layer.editedPhoto = null;">
					<div class="ya-pop-up__wrapper">
						<span class="ya-pop-up__close-btn" ng-click="layer.editedPhoto = null;">X</span>
						<div class="ya-pop-up__content" ng-click="$event.stopPropagation();">

							<div class="ya-form__input ya-input ya-input_inline">
								<div class="ya-clearfix">
									<div class="ya-grid-1-3 ya-right">
										<label for="ya-photo-name" class="ya-input__label">
											Название фото
										</label>
									</div>
									<div class="ya-grid-2-3">
										<div class="ya-input__field-wrapper">
											<input Id="ya-photo-name" type="text" placeholder="Название фото" class="ya-input__field" ng-model="layer.editedPhoto.title">
										</div>
									</div>
								</div>
							</div>
							<div class="ya-form__input ya-input ya-input_inline">
								<div class="ya-clearfix">
									<div class="ya-grid-1-3 ya-right">
										<label for="ya-album" class="ya-input__label">
											Альбом
										</label>
									</div>
									<div class="ya-grid-2-3">
										<div class="ya-input__field-wrapper">
											<select ng-model="layer.editedPhoto.album" id="ya-album" class="ya-input__field ya-input__field_select ya-input__select">
												<option ng-value="al._id" ng-repeat="al in albums">{{al.title}}</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="ya-form__input ya-input ya-input_inline">
								<div class="ya-clearfix">
									<div class="ya-grid-1-2 ya-center">
										<button ng-click="layer.editedPhoto = null;" class="ya-btn ya-btn_secondary ya-btn_inline">Отменить</button>
									</div>
									<div class="ya-grid-1-2 ya-center">
										<button ng-click="edit_photo(layer.editedPhoto)" class="ya-btn ya-btn_primary ya-btn_inline">Сохранить</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ya-pop-up ya-pop-up_small ya-pop-up_active" ng-hide="layer.editedAlbum == null" ng-click="layer.editedAlbum = null;">
					<div class="ya-pop-up__wrapper">
						<span class="ya-pop-up__close-btn" ng-click="layer.editedAlbum = null;">X</span>
						<div class="ya-pop-up__content" ng-click="$event.stopPropagation();">

							<div class="ya-form__input ya-input ya-input_inline">
								<div class="ya-clearfix">
									<div class="ya-grid-1-3 ya-right">
										<label for="ya-photo-name" class="ya-input__label">
											Название альбома
										</label>
									</div>
									<div class="ya-grid-2-3">
										<div class="ya-input__field-wrapper">
											<input type="text" class="ya-input__field" placeholder="Название альбома" ng-model="layer.editedAlbum.title">
										</div>
									</div>
								</div>
							</div>
							<div class="ya-form__input ya-input ya-input_inline">
								<div class="ya-clearfix">
									<div class="ya-grid-1-2 ya-center">
										<button ng-click="layer.editedAlbum = null;" class="ya-btn ya-btn_secondary ya-btn_inline">Отменить</button>
									</div>
									<div class="ya-grid-1-2 ya-center">
										<button ng-click="edit_album(layer.editedAlbum)" class="ya-btn ya-btn_primary ya-btn_inline">Сохранить</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<section tabindex="0" ng-hide="gallery.current === null" ng-keypress="escape_pressed($event) && (gallery.current = null);">
					<div class="ya-pop-up ya-pop-up_active" ng-click="gallery.current = null">
						<div class="ya-pop-up__wrapper">
							<span class="ya-pop-up__close-btn" ng-click="gallery.current = null">X</span>
							<div class="ya-pop-up__content ya-clearfix" ng-click="$event.stopPropagation();">
								<div class="ya-span-3-4 ya-relative ya-pop-up__main">
									<div class="ya-pop-up-photo" ng-style="{'background-image':'url(' + photos[gallery.current].image + ')'}" ng-click="turn_right()">
									</div>
									<span
										class="ya-pop-up-photo__btn ya-pop-up-photo__btn_left"
										ng-click="turn_left();"
									>
									</span>
									<span
										class="ya-pop-up-photo__btn ya-pop-up-photo__btn_right"
										ng-click="turn_right()"
									>
									</span>
								</div>
								<div class="ya-span-1-4 ya-relative ya-pop-up__additional">
									<div class="ya-pop-up-comments">
									<div class="ya-pop-up-comments__wrapper">
										<div class="ya-wall__news-author ya-relative ya-clearfix">
											<div class="ya-avatar ya-avatar_small ya-wall__avatar">
												<img ng-src="{{c.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
											</div>
											<div class="ya-wall__news-info">
												<div class="ya-wall__author-name">
													Ивавнов Иван
												</div>
												<div class="ya-wall__news-date">
													01.01.2017
												</div>
											</div>
										</div>
										<div class="ya-pop-up-comments__title">
											{{photos[gallery.current].title}}
										</div>
										<div class="ya-pop-up-comments__likes-wrapper">
												<span class="ya-pop-up-comments__likes-link" ng-if="options.user">
													<span
														class="ya-pop-up-comments__likes"
														ng-click="like(photos[gallery.current], gallery.current)"
													></span>
												</span>
												<span class="ya-pop-up-comments__likes-count"  ng-if="options.user">
													{{photos[gallery.current].likes.length}} Нравится
												</span>
										</div>
										<div class="ya-walls__comments">
											<div class="ya-comments ya-comments_small">
												<div class="ya-comments__list">
													<div class="ya-comments__item" ng-repeat="c in photos[gallery.current].comments">
														<div class="ya-wall__news-author ya-relative ya-clearfix">
															<div class="ya-wall__news-remove" ng-if="c.userid === options.user._id" ng-click="remove_comment(gallery.current, c.comment)">x</div>
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
															<pre>{{c.comment}}</pre>
														</div>
													</div>
												</div>
											</div>
											<form
												ng-submit="add_comment(gallery.current_photo)"
												class="ya-comments__add-form ya-input"
											>
												<div class="ya-form__input ya-input ya-input_inline">
													<input
													type="text"
													ng-model="gallery.comment"
													placeholder="Комментировать"
													class="ya-comments__add-field ya-input__field"
												>
												</div>
												<div class="ya-form__input ya-input ya-input_inline">
													<!--button class="ya-btn ya-btn_primary ya-btn_small ya-btn_plus ya-btn_inline ya-new-post__btn" ng-click="add_comment(gallery.current_photo)">Комментировать</button-->
												</div>
											</form>
										</div>
										<!--span>
											<i
												class="fa fa-lg"
												ng-if="options.userid === options.user._id"
												ng-click="set_avatar(photos[gallery.current])"
												ng-class="{'fa-check-circle-o':photos[gallery.current].image !== options.user.avatar,'fa-check-circle':photos[gallery.current].image === options.user.avatar}"
											></i>
										</span-->
									</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
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
