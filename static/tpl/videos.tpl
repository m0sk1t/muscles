<article class="ya-videos-page ya-media-page ya-container">
	<div class="ya-narrower">
		<div class="ya-row">
			<div class="ya-grid-4-5">
				<div class="ya-media-page__gallery">
					<h2 class="ya-media-page__title ya-relative">
						{{options.user._id === options.userid?'Мои видео':'Видео пользователя'}}
						<span
							class="ya-albums__create-btn"
							ng-if="options.user._id === options.userid"
							ng-click="layer.addVideo = {link:'',title:''}"
						></span>
					</h2>

					<div class="ya-photos ya-photos_profile">
						<div class="ya-photos__list ya-photos__list_empty" ng-show="!videos || !videos.length">
							Пока не добавлено ни одного видео
						</div>
						<div class="ya-photos__list ya-clearfix" ng-show="videos && videos.length">
							<div class="ya-photos__item ya-photos__item_large ya-inner-grid-1-4" ng-repeat="v in videos track by $index">
								<div class="ya-photos__wrapper">
									<div class="ya-photos__img ya-photos__img_large" ng-click="gallery.current = $index" ng-style="{'background-image':'url(' + v.thumbnail + ')'}"></div>
									<i
										class="fa fa-lg fa-trash"
										ng-click="delete_video($index)"
										ng-if="options.user._id === v.owner"
									></i>
									<i
										class="fa fa-lg fa-edit"
										ng-click="layer.editedVideo = v;"
										ng-if="options.user._id === v.owner"
									></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<section class="adding-video" ng-show="layer.addVideo">
					<div>
						<input type="text" placeholder="Название видео" ng-model="layer.addVideo.title">
						<input type="text" placeholder="Ссылка на видео" ng-model="layer.addVideo.link">
						<button ng-click="layer.addVideo = null;">Отменить!</button>
						<button ng-click="add_video(layer.addVideo)">Сохранить!</button>
					</div>
				</section>
				<section class="edit-video" ng-show="layer.editedVideo">
					<div>
						<input type="text" placeholder="Название видео" ng-model="layer.editedVideo.title">
						<button ng-click="layer.editedVideo = null;">Отменить!</button>
						<button ng-click="edit_video(layer.editedVideo)">Сохранить!</button>
					</div>
				</section>
				<section class="gallery" ng-hide="gallery.current === null">
					<div class="video-area">
						<span
							class="left"
							ng-click="turn_left();"
						>
							&lt;
						</span>
						<span class="video">
							<span ng-click="gallery.current = null">X</span>
							<iframe ng-if="videos[gallery.current].type==='vimeo'" width="640" height="480" ng-src="{{include_video('vimeo', videos[gallery.current].link)}}" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>
							<iframe ng-if="videos[gallery.current].type==='youtube'" width="640" height="480" ng-src="{{include_video('youtube', videos[gallery.current].link)}}" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>
							<span>
								<div>
									<div class="comment" ng-repeat="c in videos[gallery.current].comments">
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
							<div>

								<span ng-if="options.user">
									<i
										class="fa fa-lg"
										ng-click="like(v, $index)"
										ng-class="{'fa-heart-o':!i_like_it(v.likes),'fa-heart':i_like_it(v.likes)}"
									></i>{{v.likes.length}}
								</span>
								<span ng-if="options.user">
									<i
										class="fa fa-lg fa-comment"
									></i>{{v.comments.length}}
								</span>
								{{::v.title}}
							</div>
							</span>
						<span
							class="right"
							ng-click="turn_right()"
						>
							&gt;
						</span>
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
