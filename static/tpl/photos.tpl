<article class="ya-photos-page ya-container">
	<div class="ya-narrower">
		<div class="ya-row">
			<div class="ya-grid-4-5">
				<section>
					<div>
						{{options.user._id === options.userid?'Мои альбомы':'Альбомы пользователя'}}
						<span class="create" ng-click="create_album()" ng-if="options.user._id === options.userid">
							Создать альбом
						</span>
					</div>
					<div class="albums">
						<div
							class="album"
							ng-repeat="a in albums"
						>
							<a href="#/user/{{options.userid}}/album/{{a._id}}">
								<img ng-src="{{a.cover.image}}">
								{{::a.title}}
							</a>
							<span>
								<i
									class="fa fa-lg fa-trash"
									ng-click="delete_album(a._id)"
									ng-if="options.user._id === a.owner"
								></i>
								<i
									class="fa fa-lg fa-edit"
									ng-click="layer.editedAlbum = a"
									ng-if="options.user._id === a.owner"
								></i>
							</span>
						</div>
					</div>
				</section>
				<section>
					<div>{{options.user._id === options.userid?'Мои фотографии':'Фотографии пользователя'}}</div>
					<div
						class="drop-box"
						ngf-multiple="true"
						ngf-pattern="'image/*'"
						ngf-drop="upload_files($files)"
						ngf-drag-over-class="'dragover'"
						ngf-select="upload_files($files)"
						ng-if="options.user._id === options.userid"
					>
						Бросьте сюда картинки либо кликните
					</div>
					<div class="ya-photos ya-photos_profile">
						<div class="ya-photos__list ya-photos__list_empty" ng-show="!photos || !photos.length">
							Пока не добавлено ни одной фотографии
						</div>
						<div class="ya-photos__list ya-clearfix" ng-show="photos && photos.length">
							<div class="ya-photos__item ya-photos__item_large ya-inner-grid-1-4" ng-repeat="p in photos track by $index">
								<div class="ya-photos__wrapper">
									<div class="ya-photos__img ya-photos__img_large" ng-click="gallery.current = $index" ng-style="{'background-image':'url(' + p.image + ')'}"></div>
									<i
										class="fa fa-lg fa-trash"
										ng-click="delete_photo(p._id)"
										ng-if="options.user._id === p.owner"
									></i>
									<i
										class="fa fa-lg fa-edit"
										ng-click="layer.editedPhoto = p;"
										ng-if="options.user._id === p.owner"
									></i>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section class="edit-photo" ng-class="{hide: layer.editedPhoto == null, show: layer.editedPhoto != null}">
					<div>
						<input type="text" placeholder="Название фото" ng-model="layer.editedPhoto.title">
						<select ng-model="layer.editedPhoto.album">
							<option ng-value="al._id" ng-repeat="al in albums">{{al.title}}</option>
						</select>
						<button ng-click="layer.editedPhoto = null;">Отменить!</button>
						<button ng-click="edit_photo(layer.editedPhoto)">Сохранить!</button>
					</div>
				</section>
				<section class="edit-album" ng-class="{hide: layer.editedAlbum == null, show: layer.editedAlbum != null}">
					<div>
						<input type="text" placeholder="Название альбома" ng-model="layer.editedAlbum.title">
						<button ng-click="layer.editedAlbum = null;">Отменить!</button>
						<button ng-click="edit_album(layer.editedAlbum)">Сохранить!</button>
					</div>
				</section>
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
										<div>
											<span>
												<span ng-if="options.user">
													<i
														ng-click="like(photos[gallery.current], gallery.current)"
														class="fa fa-lg fa-heart-o"
													></i>{{photos[gallery.current].likes.length}}
												</span>
												<span ng-if="options.user">
													<i
														class="fa fa-lg fa-comment"
													></i>{{photos[gallery.current].comments.length}}
												</span>
												{{::photos[gallery.current].title}}
											</span>
										</div>
										<div class="comment" ng-repeat="c in photos[gallery.current].comments">
											<a href="#/user/{{c.userid}}">{{c.name + ' ' + c.surname}}</a>:
											{{c.comment}}
											<i
												class="fa fa-lg fa-close"
												ng-if="c.userid === options.user._id"
												ng-click="remove_comment(gallery.current, c.comment)"
											></i>
										</div>
										<span>
											<i
												class="fa fa-lg"
												ng-if="options.userid === options.user._id"
												ng-click="set_avatar(photos[gallery.current])"
												ng-class="{'fa-check-circle-o':photos[gallery.current].image !== options.user.avatar,'fa-check-circle':photos[gallery.current].image === options.user.avatar}"
											></i>
										</span>
										<input type="text" ng-model="gallery.comment">
										<button ng-click="add_comment(gallery.current_photo)">&gt;</button>
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
