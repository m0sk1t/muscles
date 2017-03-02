<article class="ya-user ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-1-3">
                <div class="ya-page__block ya-page__block_colored">
                    <div class="ya-user__main-info ya-relative">
                        <span class="ya-online-id ya-online-id_large ya-online-id_main" ng-class="{'ya-online-id_online_yes': user.online,'ya-online-id_online_no': !user.online}">
						</span>
                        <div class="ya-user__avatar ya-avatar ya-avatar_large">
                            <a class="ya-avatar__link" href="#/options/profile">
                                <img class="ya-avatar__img" ng-src="{{user.avatar || '/images/avatar.jpg'}}" alt="{{user.name}} {{user.surname}}">
                            </a>
                        </div>
                        <div class="ya-user__name">
                            {{user.name}} {{user.surname}}{{get_age(user.birthDate)?', ' + get_age(user.birthDate):''}}
                        </div>
                        <div class="ya-user__city">
                            {{user.location_country.title}} {{user.location_city.title? ', ' + user.location_city.title:''}}
                        </div>
                    </div>
                    <div class="ya-user__config-block ya-clearfix">
                        <div class="ya-span-2-3">
                            <div class="ya-user__raiting ya-raiting">
                                <span>{{rating || ''}}</span>
                                <span ng-click="mark(5);" class="ya-raiting__star" ng-class="{'ya-raiting__star_full': rating >= 5, 'ya-raiting__star_empty': rating === 4, 'ya-raiting__star_half': (rating>4)&&(rating<5)}"></span>
                                <span ng-click="mark(4);" class="ya-raiting__star" ng-class="{'ya-raiting__star_full': rating >= 4, 'ya-raiting__star_empty': rating === 3, 'ya-raiting__star_half': (rating>3)&&(rating<4)}"></span>
                                <span ng-click="mark(3);" class="ya-raiting__star" ng-class="{'ya-raiting__star_full': rating >= 3, 'ya-raiting__star_empty': rating === 2, 'ya-raiting__star_half': (rating>2)&&(rating<3)}"></span>
                                <span ng-click="mark(2);" class="ya-raiting__star" ng-class="{'ya-raiting__star_full': rating >= 2, 'ya-raiting__star_empty': rating === 1, 'ya-raiting__star_half': (rating>1)&&(rating<2)}"></span>
                                <span ng-click="mark(1);" class="ya-raiting__star" ng-class="{'ya-raiting__star_full': rating >= 1, 'ya-raiting__star_empty': !rating, 'ya-raiting__star_half': (rating>0)&&(rating<1)}"></span>
                            </div>
                        </div>
                        <div class="ya-user__options ya ya-span-1-3">
                            <div class="ya-user__possible-actions" ng-if="options.user._id === user._id">
                                <a href="#/options/profile" class="ya-user__options-btn"></a>
                                <a href="/logout" class="ya-user__logout-btn ya-logout-btn"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ya-clearfix ya-user-actions" ng-if="options.user._id !== user._id">
                    <div class="ya-grid-4-5">
                        <button class="ya-btn ya-btn_blocked" ng-click="write_message();">Написать сообщение</button>
                    </div>
                    <div class="ya-grid-1-5">
                        <span class="ya-btn ya-btn_blocked" ng-class="{'ya-btn_secondary ya-btn_fav': in_fav(user._id)}" ng-click="fav();"><span class="fa fa-star" aria-hidden="true"></span></span>
                    </div>


                </div>
                <div class="ya-user__sports ya-sidebar-info ya-relative">
                    <a href="#/options/work_n_study">
                        <div class="ya-sidebar-info__icon ya-sidebar-info__icon_sports">
                        </div>
                    </a>
                    <div class="ya-page__block ya-page__block_rounded">
                        <h2 class="ya-sidebar-info__title">
                            Виды спорта
                        </h2>
                        <div class="ya-sidebar-info__content-wrapper" ng-show="false">
                            <div class="ya-sidebar-info__content">
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Виды спорта не добавлены.</span>
                                </div>
                            </div>
                        </div>
                        <div class="ya-sidebar-info__content-wrapper" ng-show="true">
                            <div class="ya-sidebar-info__content">
                                <div class="ya-sidebar-info__item" ng-repeat="s in user.sports">
                                    {{s}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ya-user__awards ya-sidebar-info ya-relative">
                    <a href="#/options/work_n_study">
                        <div class="ya-sidebar-info__icon ya-sidebar-info__icon_awards">
                        </div>
                    </a>
                    <div class="ya-page__block ya-page__block_rounded">
                        <h2 class="ya-sidebar-info__title">
                            Достижения
                        </h2>
                        <div class="ya-sidebar-info__content-wrapper" ng-show="!user.achievements || !user.achievements.length">
                            <div class="ya-sidebar-info__content">
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Достижения не добавлены.</span>
                                </div>
                            </div>
                        </div>
                        <div class="ya-sidebar-info__content-wrapper" ng-show="user.achievements && user.achievements.length" ng-repeat="a in user.achievements track by $index">
                            <div class="ya-sidebar-info__content">
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Страна</span> {{a.country.title}}
                                </div>
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Город</span> {{a.city.title}}
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
                </div>
                <div class="ya-user__work ya-sidebar-info ya-relative">
                    <a href="#/options/work_n_study">
                        <div class="ya-sidebar-info__icon ya-sidebar-info__icon_work">
                        </div>
                    </a>
                    <div class="ya-page__block ya-page__block_rounded">
                        <h2 class="ya-sidebar-info__title">
                            Работа
                        </h2>
                        <div class="ya-sidebar-info__content-wrapper" ng-show="!user.workplaces || !user.workplaces.length">
                            <div class="ya-sidebar-info__content">
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Работа не добавлена.</span>
                                </div>
                            </div>
                        </div>
                        <div class="ya-sidebar-info__content-wrapper" ng-show="user.workplaces && user.workplaces.length" ng-repeat="w in user.workplaces track by $index">
                            <div class="ya-sidebar-info__content">
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Страна</span> {{w.country.title}}
                                </div>
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Город</span> {{w.city.title}}
                                </div>
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Годы</span> {{w.year_start}} - {{w.year_end||'по н. вр.'}}
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
                </div>
                <div class="ya-user__edu ya-sidebar-info ya-relative">
                    <a href="#/options/work_n_study">
                        <div class="ya-sidebar-info__icon ya-sidebar-info__icon_edu">
                        </div>
                    </a>
                    <div class="ya-page__block ya-page__block_rounded">
                        <h2 class="ya-sidebar-info__title">
                            Образование
                        </h2>
                        <div class="ya-sidebar-info__content-wrapper" ng-show="!user.universities || !user.universities.length">
                            <div class="ya-sidebar-info__content">
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Учебные заведения не добавлены.</span>
                                </div>
                            </div>
                        </div>
                        <div class="ya-sidebar-info__content-wrapper" ng-show="user.universities && user.universities.length" ng-repeat="u in user.universities track by $index">
                            <div class="ya-sidebar-info__content">
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Страна</span> {{u.country.title}}
                                </div>
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Город</span> {{u.city.title}}
                                </div>
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Годы</span> {{u.year_start}} - {{u.year_end||'по н. вр.'}}
                                </div>
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Учреждение</span> {{u.university.title}}
                                </div>
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Факультет</span> {{u.faculty.title}}
                                </div>
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Кафедра</span> {{u.chair.title}}
                                </div>
                                <div class="ya-sidebar-info__item">
                                    <span class="ya-sidebar-info__label">Специальность</span> {{u.speciality}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ya-grid-7-15">
                <div class="ya-page__block ya-page__block_bordered ya-user__text-info">
                    <div class="ya-user__info-block ya-info-block ya-info-block_border_no">
                        <div class="ya-clearfix ya-user__status-line">
                            <div class="ya-user__status ya-grid-1-2">{{user.status}}</div>
                            <div ng-if="options.user._id !== user._id" class="ya-user__status ya-grid-1-2 ya-right">Заходил {{last_seen()}}</div>
                        </div>
                    </div>
                    <div class="ya-user__info-block">
                        <div class="ya-info-block">
                            <h2 class="ya-info-block__title ya-info-block__title_data">
                                <a ng-if="options.user._id === user._id" href="#/options/profile">
                                    Данные спортсмена
                                </a><span ng-if="options.user._id !== user._id">Данные спортсмена</span>
                            </h2>
                            <div class="ya-info-block__content ya-clearfix">
                                <div class="ya-inner-grid-1-2">
                                    <div class="ya-info-block__record ya-clearfix">
                                        <div class="ya-info-block__label ya-span-1-2">Возраст:</div>
                                        <div class="ya-info-block__value ya-span-1-2">{{get_age(user.birthDate) || "Не указано"}}</div>
                                    </div>
                                    <div class="ya-info-block__record ya-clearfix">
                                        <div class="ya-info-block__label ya-span-1-2">Рост:</div>
                                        <div class="ya-info-block__value ya-span-1-2">{{user.height || "Не указано"}}</div>
                                    </div>
                                    <div class="ya-info-block__record ya-clearfix">
                                        <div class="ya-info-block__label ya-span-1-2">Вес:</div>
                                        <div class="ya-info-block__value ya-span-1-2">{{user.weight || "Не указано"}}</div>
                                    </div>
                                    <div class="ya-info-block__record ya-clearfix">
                                        <div class="ya-info-block__label ya-span-1-2">Цвет волос:</div>
                                        <div class="ya-info-block__value ya-span-1-2">{{user.hairs || "Не указано"}}</div>
                                    </div>
                                </div>
                                <div class="ya-inner-grid-1-2">
                                    <div class="ya-info-block__record ya-clearfix">
                                        <div class="ya-info-block__label ya-span-1-2">Грудь:</div>
                                        <div class="ya-info-block__value ya-span-1-2">{{user.chest || "Не указано"}}</div>
                                    </div>
                                    <div class="ya-info-block__record ya-clearfix">
                                        <div class="ya-info-block__label ya-span-1-2">Талия:</div>
                                        <div class="ya-info-block__value ya-span-1-2">{{user.waist || "Не указано"}}</div>
                                    </div>
                                    <div class="ya-info-block__record ya-clearfix">
                                        <div class="ya-info-block__label ya-span-1-2">Бедра:</div>
                                        <div class="ya-info-block__value ya-span-1-2">{{user.huckle || "Не указано"}}</div>
                                    </div>
                                    <div class="ya-info-block__record ya-clearfix">
                                        <div class="ya-info-block__label ya-span-1-2">Телосложение:</div>
                                        <div class="ya-info-block__value ya-span-1-2">{{user.typage || "Не указано"}}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-user__info-block">
                        <div class="ya-info-block">
                            <h2 class="ya-info-block__title ya-info-block__title_add"><a ng-if="options.user._id === user._id" href="#/options/work_n_study">Доп.информация</a><span ng-if="options.user._id !== user._id">Доп.информация</span></h2>
                            <div class="ya-info-block__content">
                                <div class="ya-info-block__record ya-clearfix" ng-repeat="h in user.hobbies" ng-if="h.type == 'false'">
                                    <div class="ya-info-block__label ya-inner-grid-1-4">{{h.experience}}</div>
                                    <div class="ya-info-block__value ya-inner-grid-3-4">{{h.item}}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-user__info-block">
                        <div class="ya-info-block">
                            <h2 class="ya-info-block__title ya-info-block__title_work"><a ng-if="options.user._id === user._id" href="#/options/work_n_study">Работа</a><span ng-if="options.user._id !== user._id">Работа</span></h2>
                            <div class="ya-info-block__content">
                                <div class="ya-info-block__record ya-clearfix" ng-repeat="h in user.hobbies" ng-if="h.type == 'true'">
                                    <div class="ya-info-block__label ya-inner-grid-1-4">{{h.experience}}</div>
                                    <div class="ya-info-block__value ya-inner-grid-3-4">{{h.item}}</div>
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
                                            <a href="#" target="_blank" class="ya-socials__link ya-socials__link_profile ya-socials__link_vk">
                                                <span class="ya-socials__logo ya-socials__logo_vk"></span>
                                            </a>
                                            <a class="ya-socials__link ya-socials__link_friends">{{user.social.vk.friends.summary.total_count || 'н\\д'}}</a>
                                        </div>
                                        <div class="ya-socials__item ya-clearfix">
                                            <a href="#" target="_blank" class="ya-socials__link ya-socials__link_profile ya-socials__link_fb">
                                                <span class="ya-socials__logo ya-socials__logo_fb"></span>
                                            </a>
                                            <a class="ya-socials__link ya-socials__link_friends">{{user.social.fb._json.friends.summary.total_count || 'н\\д'}}</a>
                                        </div>
                                        <div class="ya-socials__item ya-clearfix">
                                            <a href="#" target="_blank" class="ya-socials__link ya-socials__link_profile ya-socials__link_tw">
                                                <span class="ya-socials__logo ya-socials__logo_tw"></span>
                                            </a>
                                            <a href="#" target="_blank" class="ya-socials__link ya-socials__link_friends">{{user.social.tw._json.friends_count || 'н\\д'}}</a>
                                        </div>
                                        <div class="ya-socials__item ya-clearfix">
                                            <a href="#" target="_blank" class="ya-socials__link ya-socials__link_profile ya-socials__link_ok">
                                                <span class="ya-socials__logo ya-socials__logo_ok"></span>
                                            </a>
                                            <a href="#" target="_blank" class="ya-socials__link ya-socials__link_friends">{{user.social.ok._json.friends_count || 'н\\д'}}</a>
                                        </div>
                                        <div class="ya-socials__item ya-clearfix">
                                            <a href="#" target="_blank" class="ya-socials__link ya-socials__link_profile ya-socials__link_ig">
                                                <span class="ya-socials__logo ya-socials__logo_ig"></span>
                                            </a>
                                            <a href="#" target="_blank" class="ya-socials__link ya-socials__link_friends">{{user.social.im._json.data.counts.follows || 'н\\д'}}</a>
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
                        <div class="ya-photos__list ya-photos__list_empty" ng-show="!photos || !photos.length">
                            Пока не добавлено ни одной фотографии
                        </div>
                        <div class="ya-photos__list ya-clearfix" ng-show="photos && photos.length">
                            <div class="ya-photos__item ya-grid-1-4" ng-show="photos && photos[0]">
                                <div class="ya-photos__wrapper">
                                    <div class="ya-photos__img" ng-click="gallery.current_photo = 0;" ng-style="{'background-image':'url(' + photos[0].image + ')'}"></div>
                                </div>
                            </div>
                            <div class="ya-photos__item ya-grid-1-4" ng-show="photos && photos[1]">
                                <div class="ya-photos__wrapper">
                                    <div class="ya-photos__img" ng-click="gallery.current_photo = 1;" ng-style="{'background-image':'url(' + photos[1].image + ')'}"></div>
                                </div>
                            </div>
                            <div class="ya-photos__item ya-grid-1-4" ng-show="photos && photos[2]">
                                <div class="ya-photos__wrapper">
                                    <div class="ya-photos__img" ng-click="gallery.current_photo = 2;" ng-style="{'background-image':'url(' + photos[2].image + ')'}"></div>
                                </div>
                            </div>
                            <div class="ya-photos__item ya-grid-1-4" ng-show="photos && photos[3]">
                                <div class="ya-photos__wrapper">
                                    <div class="ya-photos__img" ng-click="gallery.current_photo = 3;" ng-style="{'background-image':'url(' + photos[3].image + ')'}"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ya-page__block ya-user__photos">
                    <div class="ya-photos ya-photos_profile">
                        <h2 class="ya-photos__title ya-photos__title_video"><a href="#/user/{{user._id}}/videos/all" class="ya-photos__link">Видео</a></h2>
                        <div class="ya-photos__list ya-photos__list_empty" ng-show="!videos || !videos.length">
                            Пока не добавлено ни одного видео
                        </div>
                        <div class="ya-photos__list ya-clearfix" ng-show="videos && videos.length">
                            <div class="ya-photos__item ya-grid-1-3" ng-show="videos && videos[0]">
                                <div class="ya-photos__wrapper">
                                    <div class="ya-photos__img" ng-click="gallery.current_video = 0;" ng-style="{'background-image':'url(' + videos[0].thumbnail + ')'}"></div>
                                </div>
                            </div>
                            <div class="ya-photos__item ya-grid-1-3" ng-show="videos && videos[1]">
                                <div class="ya-photos__wrapper">
                                    <div class="ya-photos__img" ng-click="gallery.current_video = 1;" ng-style="{'background-image':'url(' + videos[1].thumbnail + ')'}"></div>
                                </div>
                            </div>
                            <div class="ya-photos__item ya-grid-1-3" ng-show="videos && videos[2]">
                                <div class="ya-photos__wrapper">
                                    <div class="ya-photos__img" ng-click="gallery.current_video = 2;" ng-style="{'background-image':'url(' + videos[2].thumbnail + ')'}"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ya-user_new-post ya-new-post">
                    <div class="ya-new-post__btn-wrapper ya-right" ng-show="!topic">
                        <button class="ya-btn ya-btn_primary ya-btn_small ya-btn_plus ya-btn_inline ya-new-post__btn" ng-click="add_topic()" ng-if="options.user._id === user._id">
							Добавить новость
						</button>
                    </div>
                    <div class="ya-new-post__form" ng-show="topic">
                        <div class="ya-form">
                            <div class="ya-form__input ya-input ya-input_inline ya-input_small-pad">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-5">
                                        <!--div class="ya-avatar ya-avatar_auto">
                                            <img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                                        </div-->
                                         <div class="ya-avatar ya-avatar_auto" ng-style="{'background-image':'url(' + (user.avatar || '/images/avatar.jpg') + ')'}"></div>
                                    </div>
                                    <div class="ya-grid-4-5">
                                        <div class="ya-input__field-wrapper ya-input__field-wrapper_textarea ya-relative">
                                            <textarea rows="10" class="ya-input__field ya-input__field_textarea ya-input__field_unbordered ya-shadow" ng-model="topic.text" placeholder="Введите текст"></textarea>
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
                        </div>
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
                        <div class="ya-form">
                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-1 ya-right">
                                        <span class="ya-btn ya-btn_secondary ya-btn_small ya-btn_inline" ng-click="topic.text && new_topic(); (topic = null);">Сохранить</span>
                                        <span class="ya-btn ya-btn_primary ya-btn_small ya-btn_plus ya-btn_plusless ya-btn_inline" ng-click="topic = null">Отменить</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ya-page__block ya-page__block_bordered ya-user__wall">
                    <div class="ya-wall">
                        <h2 class="ya-wall__title">Мои объявления</h2>
                        <div class="ya-wall__news">
                            <div class="ya-wall__news-list">
                                <div class="ya-wall__news-item" ng-show="!topics || !topics.length">
                                    <div class="ya-wall__news-content">
                                        <div class="ya-wall__news-text">
                                            Пока не добавлено ни одного объявления.
                                        </div>
                                    </div>
                                </div>
                                <div class="ya-wall__news-item" ng-show="topics && topics.length" ng-repeat="t in topics track by $index">
                                    <div class="ya-wall__news-content">
                                        <div class="ya-wall__news-author ya-relative ya-clearfix">
                                            <div class="ya-wall__news-remove" ng-if="options.user._id === user._id" ng-click="del_topic($index)">x</div>
                                            <!--div class="ya-avatar ya-avatar_small ya-wall__avatar">
                                                <img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                                            </div-->
                                            <div class="ya-avatar ya-avatar_small ya-wall__avatar" ng-style="{'background-image':'url(' + (user.avatar || '/images/avatar.jpg') + ')'}"></div>
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
                                            <pre>{{t.text}}</pre>
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
                                                        <div class="ya-wall__news-author ya-relative ya-clearfix">
                                                            <div class="ya-wall__news-remove" ng-if="options.user._id === c.userid" ng-click="remove_topic_comment($index, c.comment)">x</div>
                                                            <!--div class="ya-avatar ya-avatar_small ya-wall__avatar">
                                                                <img ng-src="{{c.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                                                            </div-->
                                                            <div class="ya-avatar ya-avatar_small ya-wall__avatar" ng-style="{'background-image':'url(' + (c.avatar || '/images/avatar.jpg') + ')'}"></div>
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
                                                <form ng-if="user.comments_enabled" ng-submit="add_topic_comment($index)" class="ya-comments__add-form ya-input">
                                                    <input type="text" ng-model="topic.comment" placeholder="Комментировать" class="ya-comments__add-field ya-input__field">
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
                <user-links-block class="ya-page__block ya-page__block_colored"></user-links-block>
                <ads-block class="ya-page__block ya-page__block_colored"></ads-block>
            </div>
        </div>
        <div ng-show="gallery.add_image">
            <div class="ya-pop-up ya-pop-up_active" ng-click="gallery.add_image = null;">
                <div class="ya-pop-up__wrapper">
                    <span class="ya-pop-up__close-btn" ng-click="gallery.add_image = null;">X</span>
                    <div class="ya-pop-up__content" ng-click="$event.stopPropagation();">
                        <div class="ya-pick-photo">
                            <div class="ya-pick-photo__wrapper">
                                <div class="ya-center ya-pick-photo__top">
                                    <div class="ya-pick-photo__btn ya-btn ya-btn_primary ya-btn_inline" ngf-multiple="true" ngf-pattern="'image/*'" ngf-drop="upload_files($files)" ngf-drag-over-class="'dragover'" ngf-select="upload_files($files)" ng-if="options.user._id === user._id">
                                        Загрузить фотографию
                                    </div>
                                </div>
                                <div class="ya-pick-photo__list">
                                    <div class="ya-photos ya-photos_profile">
                                        <div class="ya-photos__list ya-photos__list_empty" ng-show="!photos || !photos.length">
                                            Пока не добавлено ни одной фотографии
                                        </div>
                                        <div class="ya-photos__list ya-clearfix" ng-show="photos && photos.length">
                                            <div class="ya-photos__item ya-photos__item_large ya-inner-grid-1-4" ng-repeat="p in photos">
                                                <div class="ya-photos__wrapper">
                                                    <div class="ya-photos__img ya-photos__img_large" ng-click="add_image_to_topic(p.image);" ng-style="{'background-image':'url(' + p.image + ')'}"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </section>
        <photo-slider-block ng-hide="gallery.current_photo === null" ng-keypress="manage_photo_keypress($event);">
        </photo-slider-block>
        <video-slider-block ng-hide="gallery.current_video === null" ng-keypress="manage_video_keypress($event);">
        </video-slider-block>
    </div>
</article>
