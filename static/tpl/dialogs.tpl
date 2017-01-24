<article class="ya-dialoges ya-container">
	<div class="ya-narrower">
		<div class="ya-row">
			<div class="ya-grid-1-3">
				<div class="ya-dialoges__penpals ya-penpals">
					<h2 class="ya-media-page__title ya-media-page__title_dialogs ya-title ya-relative ya-center">
						Поиск
					</h2>
					<div class="ya-penpals__list">
						<div class="ya-penpals__item ya-clearfix">
							<div class="ya-grid-1-5">
								<div class="ya-avatar ya-avatar_small ya-wall__avatar">
									<img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
								</div>
							</div>
							<div class="ya-grid-4-5">
								<div class="ya-penpals__title ya-clearfix">
									<div class="ya-penpals__name ya-grid-2-3 ya-left">
										Иванов Иван
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
						<div class="ya-penpals__item ya-clearfix">
							<div class="ya-grid-1-5">
								<div class="ya-avatar ya-avatar_small ya-wall__avatar">
									<img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
								</div>
							</div>
							<div class="ya-grid-4-5">
								<div class="ya-penpals__title ya-clearfix">
									<div class="ya-penpals__name ya-grid-2-3 ya-left">
										Иванов Иван
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
			<div class="ya-grid-7-15">
				<h2 class="ya-media-page__title ya-media-page__title_msgs ya-title ya-relative">
					Иванов Иван
				</h2>
				<div class="ya-dialog ya-relative">
					<div class="ya-dialog__content">
						<div class="ya-wall">
							<div class="ya-wall__news">
								<div class="ya-wall__news-list">
									<!--div class="ya-wall__news-item">
										<div class="ya-wall__news-content">
											<div class="ya-wall__news-text">
												Пока не добавлено ни одного сообщения.
											</div>
										</div>
									</div-->
									<div class="ya-wall__news-item">
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
												<pre>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi suscipit porttitor pellentesque. In tellus libero, ultrices ac sapien in, tempor consequat dui. Vivamus sem turpis, laoreet et aliquam et, auctor iaculis ex. Suspendisse tempor semper hendrerit. Morbi id pellentesque purus, a suscipit libero. Nam nec vulputate nisl, nec sodales dui. Praesent porttitor lacinia felis, ac sollicitudin tellus cursus et. Phasellus elementum diam vel eros viverra aliquet. Aliquam finibus vitae mi non faucibus. Nulla eget velit et sapien scelerisque varius. Nam tempus suscipit risus nec sodales. Cras id metus turpis.</pre>
											</div>
											<div class="ya-wall__news-media">
												<img ng-src="{{i}}" ng-repeat="i in t.images" class="ya-wall__news-img" />
											</div>
										</div>
									</div>
									<div class="ya-wall__news-item">
										<div class="ya-wall__news-content">
											<div class="ya-wall__news-author ya-relative ya-clearfix">
												<div class="ya-wall__news-remove" ng-if="options.user._id === user._id" ng-click="del_topic($index)">x</div>
												<div class="ya-avatar ya-avatar_small ya-wall__avatar">
													<img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
												</div>
												<div class="ya-wall__news-info">
													<div class="ya-wall__author-name">
														Иванов Иван
													</div>
													<div class="ya-wall__news-date">
														21.01.2017
													</div>
												</div>
											</div>
											<div class="ya-wall__news-text">
												<pre>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi suscipit porttitor pellentesque. In tellus libero, ultrices ac sapien in, tempor consequat dui. Vivamus sem turpis, laoreet et aliquam et, auctor iaculis ex. Suspendisse tempor semper hendrerit. Morbi id pellentesque purus, a suscipit libero. Nam nec vulputate nisl, nec sodales dui. Praesent porttitor lacinia felis, ac sollicitudin tellus cursus et. Phasellus elementum diam vel eros viverra aliquet. Aliquam finibus vitae mi non faucibus. Nulla eget velit et sapien scelerisque varius. Nam tempus suscipit risus nec sodales. Cras id metus turpis.</pre>
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
				<section>
					<span>
						<span>
							<div ng-repeat="d in dialogs track by $index" ng-click="set_messages(d, $index);">
								{{with_user(d)}} <!-- <i class="fa fa-lg fa-close" ng-click="delete_dialog(d, $index)"></i> -->
							</div>
						</span>
						<span>
							<div ng-repeat="m in messages">{{m.text}}</div>
							<form ng-submit="add_message()" ng-show="messages.length">
								<input type="text" ng-model="message">
							</form>
						</span>
					</span>
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
