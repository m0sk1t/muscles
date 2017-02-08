<article class="ya-contests ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-4-5">
				<div class="ya-contests">
					<h2 class="ya-media-page__title ya-relative">
                        Конкурсы
                        <span class="ya-contest__info">Об участии в конкурсе</span>
                    </h2>
                    <div class="ya-contests__tabs">
                    	<h3 class="ya-contests__subtitle">Вас интересуют конкурсы:</h3>
                    	<nav class="ya-nav-menu ya-nav-menu_view_buttons ya-nav-menu_view_icons ya-options__nav">
		                    <ul class="ya-nav-menu__list ya-clearfix">
		                        <li class="ya-nav-menu__item">
		                            <span class="ya-nav-menu__link ya-nav-menu__link_men ya-nav-menu__link_active">Для мужчин<span>
								</li>
								<li class="ya-nav-menu__item">
									<span class="ya-nav-menu__link ya-nav-menu__link_women">Для женщин<span>
								</li>
								<li class="ya-nav-menu__item">
									<span class="ya-nav-menu__link ya-nav-menu__link_both">Общие<span>
								</li>
							</ul>
						</nav>
                    </div>
                    <div class="ya-contests__content">
                    	<nav class="ya-nav-menu ya-nav-menu_view_buttons ya-nav-menu_blocked ya-options__nav">
		                    <ul class="ya-nav-menu__list ya-clearfix">
		                        <li class="ya-nav-menu__item">
		                            <span class="ya-nav-menu__link ya-nav-menu__link_featured ya-nav-menu__link_active">Анонс конкурсов<span>
								</li>
								<li class="ya-nav-menu__item">
									<span class="ya-nav-menu__link ya-nav-menu__link_archieve">История конкурсов<span>
								</li>
							</ul>
						</nav>
                    </div>
                    <div class="ya-contests__list">
                    	<div class="ya-contests__item" ng-repeat="c in contests">
							<a ng-href="#/contest/{{c._id}}" class="ya-contests__link">
								<span class="ya-contests__item-title">{{c.title}}</span> (с {{c.dateStart}} по {{c.dateEnd}}. Прием заявок с {{c.dateStart}})
							</a>
						</div>
						<div class="ya-contests__item">
							<a ng-href="#/contest/{{c._id}}" class="ya-contests__link">
								<span class="ya-contests__item-title">Мистер бицепс</span> (с 01.01.2017 по 01.02.2017. Прием заявок с 01.01.2017)
							</a>
						</div>
                        <div class="ya-contests__item">
                            <a ng-href="#/contest/{{c._id}}" class="ya-contests__link">
                                <span class="ya-contests__item-title">Мистер бицепс</span> (с 01.01.2017 по 01.02.2017. Прием заявок с 01.01.2017)
                            </a>
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
                <user-links-block class="ya-page__block ya-page__block_colored"></user-links-block>
                <ads-block class="ya-page__block ya-page__block_colored"></ads-block>
            </div>
		</div>
	</div>
</article>
