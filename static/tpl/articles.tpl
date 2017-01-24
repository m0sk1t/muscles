<article class="ya-articles-page ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
	<div class="ya-narrower">
		<div class="ya-row">
			<div class="ya-grid-4-5">
				<div class="ya-articles">
					<h2 class="ya-media-page__title ya-title ya-relative">
						Новости в мире спорта
					</h2>
					<div class="ya-articles__filter ya-hr ya-clearfix">
						<div class="ya-grid-1-2">
							<div class="ya-clearfix">
								<div class="ya-grid-1-3 ya-right">
									<label for="ya-sport" class="ya-input__label ya-input__label_big">
										Вид спорта
									</label>
								</div>
								<div class="ya-grid-2-3">
									<div class="ya-input__field-wrapper">
										<select id="ya-sport" class="ya-input__field ya-input__field_select ya-input__select">
											<option value=""></option>
											<option value="Спорт 1">Спорт 1</option>
											<option value="Спорт 2">Спорт 2</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="ya-grid-1-2">
							<div class="ya-clearfix">
								<div class="ya-grid-1-3 ya-right">
									<label for="ya-theme" class="ya-input__label ya-input__label_big">
										Тематика
									</label>
								</div>
								<div class="ya-grid-2-3">
									<div class="ya-input__field-wrapper">
										<select id="ya-theme" class="ya-input__field ya-input__field_select ya-input__select">
											<option value=""></option>
											<option value="Тема 1">Тема 1</option>
											<option value="Тема 2">Тема 2</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ya-articles__subtitle">
						Последние добавленные
					</div>
					<div class="ya-articles__list">
						<div class="ya-articles__item">
							<div class="ya-bordered-box">
								<div class="ya-clearfix">
									<div class="ya-articles__media ya-grid-2-5">
										<img src="images/article-thumb.jpg" alt="Alternative text" class="ya-articles__thumb">
									</div>
									<div class="ya-articles__content ya-grid-3-5">
										<h3 class="ya-articles__title">Соревнованяи по бодибилдингу в г. Пенза</h3>
										<div class="ya-articles__desc">
											Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod sem eget bibendum dapibus. Quisque imperdiet pulvinar libero, sed lacinia tortor lacinia non.
										</div>
										<div class="ya-articles__readmore">
											<a href="#" class="ya-btn ya-btn_primary ya-btn_inline">Читать дальше</a>
										</div>
										<div class="ya-articles__date">
											07.07.2016
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ya-articles__item">
							<div class="ya-bordered-box">
								<div class="ya-clearfix">
									<div class="ya-articles__media ya-grid-2-5">
										<img src="images/article-thumb.jpg" alt="Alternative text" class="ya-articles__thumb">
									</div>
									<div class="ya-articles__content ya-grid-3-5">
										<h3 class="ya-articles__title">Соревнованяи по бодибилдингу в г. Пенза</h3>
										<div class="ya-articles__desc">
											Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod sem eget bibendum dapibus. Quisque imperdiet pulvinar libero, sed lacinia tortor lacinia non.
										</div>
										<div class="ya-articles__readmore">
											<a href="#" class="ya-btn ya-btn_primary ya-btn_inline">Читать дальше</a>
										</div>
										<div class="ya-articles__date">
											07.07.2016
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ya-articles__pagination ya-pagination ya-center">
						<ul class="ya-pagination__list ya-clearfix">
							<li class="ya-pagination__item ya-pagination__item_hidden">
								<a href="#" class="ya-pagination__link ya-pagination__link_box ya-pagination__link_prev">
									<
								</a>
							</li>
							<li class="ya-pagination__item ya-pagination__item_active">
								<a href="#" class="ya-pagination__link ya-pagination__link_active">
									1
								</a>
							</li>
							<li class="ya-pagination__item">
								<a href="#" class="ya-pagination__link">
									2
								</a>
							</li>
							<li class="ya-pagination__item">
								<a href="#" class="ya-pagination__link">
									3
								</a>
							</li>
							<li class="ya-pagination__item">
								<a href="#" class="ya-pagination__link">
									4
								</a>
							</li>
							<li class="ya-pagination__item">
								<a href="#" class="ya-pagination__link">
									5
								</a>
							</li>
							<li class="ya-pagination__item">
								<a href="#" class="ya-pagination__link ya-pagination__link_box ya-pagination__link_next">
									>
								</a>
							</li>
						</ul>
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
