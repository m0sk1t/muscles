<article class="ya-videos-page ya-media-page ya-container">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-4-5">
                <div class="ya-media-page__gallery">
                    <h2 class="ya-media-page__title ya-relative">
                        {{options.user._id === options.userid?'Мои видео':'Видео пользователя'}}
                        <span class="ya-albums__create-btn" ng-if="options.user._id === options.userid" ng-click="layer.addVideo = {link:'',title:''}"></span>
                    </h2>

                    <div class="ya-photos ya-photos_profile">
                        <div class="ya-photos__list ya-photos__list_empty" ng-show="!videos || !videos.length">
                            Пока не добавлено ни одного видео
                        </div>
                        <div class="ya-photos__list ya-clearfix" ng-show="videos && videos.length">
                            <div class="ya-photos__item ya-photos__item_large ya-inner-grid-1-4" ng-repeat="v in videos track by $index">
                                <div class="ya-photos__wrapper">
                                    <div class="ya-photos__img ya-photos__img_large" ng-click="gallery.current = $index" ng-style="{'background-image':'url(' + v.thumbnail + ')'}"></div>
                                    <div class="ya-photos__actions">
                                        <span class="ya-photos__action-btn fa fa-edit" ng-click="layer.editedVideo = v;" ng-if="options.user._id === v.owner"></span>
                                        <span class="ya-photos__action-btn fa fa-close" ng-click="delete_video($index)" ng-if="options.user._id === v.owner"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ya-pop-up ya-pop-up_small ya-pop-up_active" ng-hide="layer.addVideo == null" ng-click="layer.addVideo = null;">
                    <div class="ya-pop-up__wrapper">
                        <span class="ya-pop-up__close-btn" ng-click="layer.editedAlbum = null;">X</span>
                        <div class="ya-pop-up__content" ng-click="$event.stopPropagation();">

                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-3 ya-right">
                                        <label for="ya-video-name" class="ya-input__label">
											Название видео
										</label>
                                    </div>
                                    <div class="ya-grid-2-3">
                                        <div class="ya-input__field-wrapper">
                                            <input id="ya-video-name" type="text" class="ya-input__field" placeholder="Название видео" ng-model="layer.addVideo.title">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-3 ya-right">
                                        <label for="ya-video-link" class="ya-input__label">
											Ссылка на видео
										</label>
                                    </div>
                                    <div class="ya-grid-2-3">
                                        <div class="ya-input__field-wrapper">
                                            <input id="ya-video-link" type="text" class="ya-input__field" placeholder="Ссылка на видео" ng-model="layer.addVideo.link">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-2 ya-center">
                                        <button ng-click="layer.addVideo = null;" class="ya-btn ya-btn_secondary ya-btn_inline">Отменить</button>
                                    </div>
                                    <div class="ya-grid-1-2 ya-center">
                                        <button ng-click="add_video(layer.addVideo)" class="ya-btn ya-btn_primary ya-btn_inline">Сохранить</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ya-pop-up ya-pop-up_small ya-pop-up_active" ng-hide="layer.editedVideo == null" ng-click="layer.layer.editedVideo = null;">
                    <div class="ya-pop-up__wrapper">
                        <span class="ya-pop-up__close-btn" ng-click="layer.layer.editedVideo = null;">X</span>
                        <div class="ya-pop-up__content" ng-click="$event.stopPropagation();">

                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-3 ya-right">
                                        <label for="ya-video-name" class="ya-input__label">
											Название видео
										</label>
                                    </div>
                                    <div class="ya-grid-2-3">
                                        <div class="ya-input__field-wrapper">
                                            <input id="ya-video-name" type="text" class="ya-input__field" placeholder="Название видео" ng-model="layer.editedVideo.title">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-2 ya-center">
                                        <button ng-click="layer.editedVideo = null;" class="ya-btn ya-btn_secondary ya-btn_inline">Отменить</button>
                                    </div>
                                    <div class="ya-grid-1-2 ya-center">
                                        <button ng-click="edit_video(layer.editedVideo)" class="ya-btn ya-btn_primary ya-btn_inline">Сохранить</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <section tabindex="0" ng-hide="gallery.current === null" ng-keypress="escape_pressed($event) && (gallery.current = null);">
                    <div class="ya-pop-up ya-pop-up_table ya-pop-up_active" ng-click="gallery.current = null">
                        <div class="ya-pop-up__wrapper">
                            <span class="ya-pop-up__close-btn" ng-click="gallery.current = null">X</span>
                            <div class="ya-pop-up__content ya-clearfix" ng-click="$event.stopPropagation();">
                                <div class="ya-span-3-4 ya-relative ya-pop-up__main">
                                    <div class="ya-pop-up__table">
                                        <div class="ya-pop-up__cell">
                                            <iframe ng-if="videos[gallery.current].type==='vimeo'" width="640" height="480" ng-src="{{include_video('vimeo', videos[gallery.current].link)}}" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>
                                            <iframe ng-if="videos[gallery.current].type==='youtube'" width="640" height="480" ng-src="{{include_video('youtube', videos[gallery.current].link)}}" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>
                                            <span class="ya-pop-up-photo__btn ya-pop-up-photo__btn_left" ng-click="turn_left();">
											</span>
                                            <span class="ya-pop-up-photo__btn ya-pop-up-photo__btn_right" ng-click="turn_right()">
											</span>
                                        </div>
                                    </div>
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
                                                        {{user.name + ' ' + user.surname}}
                                                    </div>
                                                    <div class="ya-wall__news-date">
                                                        {{getDate(videos[gallery.current].creDate)}}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ya-pop-up-comments__title">
                                                {{videos[gallery.current].title}}
                                            </div>
                                            <div class="ya-pop-up-comments__likes-wrapper">
                                                <span class="ya-pop-up-comments__likes-link" ng-if="options.user">
												<span
													class="ya-pop-up-comments__likes"
													ng-click="like(videos[gallery.current], gallery.current)"
												></span>
                                                </span>
                                                <span class="ya-pop-up-comments__likes-count" ng-if="options.user">
												{{videos[gallery.current].likes.length}} Нравится
											</span>
                                            </div>
                                            <div class="ya-walls__comments">
                                                <div class="ya-comments ya-comments_small">
                                                    <div class="ya-comments__list">
                                                        <div class="ya-comments__item" ng-repeat="c in videos[gallery.current].comments">
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
                                                <form ng-submit="add_comment(gallery.current)" class="ya-comments__add-form ya-input">
                                                    <div class="ya-form__input ya-input ya-input_inline">
                                                        <input type="text" ng-model="gallery.comment" placeholder="Комментировать" class="ya-comments__add-field ya-input__field">
                                                    </div>
                                                    <div class="ya-form__input ya-input ya-input_inline">
                                                        <!--button class="ya-btn ya-btn_primary ya-btn_small ya-btn_plus ya-btn_inline ya-new-post__btn" ng-click="add_comment(gallery.current_photo)">Комментировать</button-->
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="gallery" ng-hide="gallery.current === null">
                    <div class="video-area">
                        <span class="left" ng-click="turn_left();">
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
								</span> {{::v.title}}
                        </div>
                        </span>
                        <span class="right" ng-click="turn_right()">
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
                            <a href="#/user/{{options.user._id}}/photos/all" class="ya-profile-links__link ya-profile-links__link_photos"><span class="ya-profile-links__link-img ya-profile-links__link-img_photos"></span></a>
                        </div>
                        <div class="ya-profile-links__link-wrapper ya-inner-grid-1-2">
                            <a href="#/user/{{options.user._id}}/videos/all" class="ya-profile-links__link ya-profile-links__link_videos"><span class="ya-profile-links__link-img ya-profile-links__link-img_videos"></span></a>
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