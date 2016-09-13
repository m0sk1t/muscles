<article class="ya-user ya-container">
	<div class="ya-narrower">
		<div class="ya-row">
			<div class="ya-grid-1-3">
				<div class="ya-page__block ya-page__block_colored">
					<div class="ya-user__main-info ya-relative">
						<span class="ya-online-id ya-online-id_online_yes ya-online-id_large ya-online-id_main">
						</span>
						<div class="ya-user__avatar ya-avatar ya-avatar_large">
							<a class="ya-avatar__link" href="#/options">
								<img class="ya-avatar__img" src="/images/avatar.jpg" ng-src="{{user.avatar}}" alt="{{user.name}} {{user.surname}}">
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
				<span ng-class="{fav: in_fav()}">&#9825;</span>
				<button  ng-if="options.user._id !== user._id" ng-click="write_message();">Написать сообщение</button>
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
					<div class="ya-sidebar-info__icon ya-sidebar-info__icon_awards"></div>
					<div class="ya-page__block ya-page__block_rounded">
						<h2 class="ya-sidebar-info__title">
							Достижения
						</h2>
						<div class="ya-sidebar-info__content-wrapper">
							<div class="ya-sidebar-info__content">
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Год</span> 2016
								</div>
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Город</span> Москва
								</div>
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Название</span> Открытый Кубок
								</div>
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Место</span> 1 место
								</div>
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Комментарии</span> Я победитель, и мне в этом мире нет равных
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ya-user__work ya-sidebar-info ya-relative">
					<div class="ya-sidebar-info__icon ya-sidebar-info__icon_work"></div>
					<div class="ya-page__block ya-page__block_rounded">
						<h2 class="ya-sidebar-info__title">
							Работа
						</h2>
						<div class="ya-sidebar-info__content-wrapper">
							<div class="ya-sidebar-info__content">
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Год</span> 2015 - 2016
								</div>
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Компания</span> РБК-Маркетинг
								</div>
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Должность</span> Директор
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ya-user__edu ya-sidebar-info ya-relative">
					<div class="ya-sidebar-info__icon ya-sidebar-info__icon_edu"></div>
					<div class="ya-page__block ya-page__block_rounded">
						<h2 class="ya-sidebar-info__title">
							Образование
						</h2>
						<div class="ya-sidebar-info__content-wrapper">
							<div class="ya-sidebar-info__content">
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Год</span> 2013
								</div>
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Учреждение</span> ИвГУ
								</div>
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Специальность</span> Специалист по рекламе
								</div>
							</div>
						</div>
						<div class="ya-sidebar-info__content-wrapper">
							<div class="ya-sidebar-info__content">
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Год</span> 2013
								</div>
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Учреждение</span> ИвГУ
								</div>
								<div class="ya-sidebar-info__item">
									<span class="ya-sidebar-info__label">Специальность</span> Специалист по рекламе
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ya-grid-7-15">
				<div class="ya-page__block ya-page__block_bordered ya-user__text-info">
					<div class="ya-user__info-block ya-info-block ya-info-block_border_no">
						<div class="ya-user__status">{{user.status}}</div>
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
				</div>

				<h3>Мои фото</h3>
		<section>
			<div class="photos">
				<img ng-click="set_current(0);" ng-src="{{photos[0].image}}">
				<img ng-click="set_current(1);" ng-src="{{photos[1].image}}">
				<img ng-click="set_current(2);" ng-src="{{photos[2].image}}">
				<img ng-click="set_current(3);" ng-src="{{photos[3].image}}">
				<img ng-click="set_current(4);" ng-src="{{photos[4].image}}">
			</div>
		</section>
		<h3>Мои записи</h3>
		<section>
			<div
				class="create"
				ng-click="add_topic()"
				ng-if="options.user._id === user._id"
			>Добавить</div>
			<div class="record" ng-repeat="t in topics track by $index">
				<div class="record-area">
					<span class="record-text">text</span>
					<img src="" alt="ava">
				</div>
				<div class="comments">
					<div class="comment">
						<img src="" alt="guest">
						<span class="comment-author">asd</span>
						<span class="comment-text">text</span>
					</div>
					<div class="comment">
						<img src="" alt="guest">
						<span class="comment-author">asd</span>
						<span class="comment-text">text</span>
					</div>
					<div class="comment">
						<img src="" alt="guest">
						<span class="comment-author">asd</span>
						<span class="comment-text">text</span>
					</div>
				</div>
			</div>
			<form ng-submit="add_topic_comment($index)">
				<input type="text" placeholder="Введите комментарий">
			</form>
		</section>
			</div>
			<div class="ya-grid-1-5">
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
					<div class="ya-socials">
						<h3 class="ya-socials__title">Подписчики</h3>
						<div class="ya-socials__list">
							<div class="ya-socials__item ya-clearfix">
								<a href="https://vk.com" target="_blank" class="ya-socials__link ya-socials__link_profile ya-socials__link_vk">
									<span class="ya-socials__logo ya-socials__logo_vk"></span>
								</a>
								<a href="https://vk.com" target="_blank" class="ya-socials__link ya-socials__link_friends">2345</a>
							</div>
							<div class="ya-socials__item ya-clearfix">
								<a href="https://vk.com" target="_blank" class="ya-socials__link ya-socials__link_profile ya-socials__link_fb">
									<span class="ya-socials__logo ya-socials__logo_fb"></span>
								</a>
								<a href="https://vk.com" target="_blank" class="ya-socials__link ya-socials__link_friends">234</a>
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


		<section>
			<div ng-show="topic">
				<div class="create" ng-click="topic = null">Отменить</div>
				<textarea cols="30" rows="10" ng-model="topic.text"></textarea>
				<div class="create" ng-click="add_image();">Добавить картинки</div>
				<div class="photos">
					<span ng-repeat="i in topic.images">
						<img ng-src="{{i}}" alt="">
						<span ng-click="add_to_topic(i);">del</span>
					</span>
				</div>
				<div class="create" ng-click="new_topic();">Сохранить запись</div>
			</div>
		</section>
		<section ng-show="gallery.add_image">
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
		</section>
		<section ng-hide="gallery.current === null">
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
		</section>
	</div>
</article>
