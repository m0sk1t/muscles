<div class="ya-pop-up ya-pop-up_active" ng-click="gallery.current_photo = null">
    <div class="ya-pop-up__wrapper">
        <span class="ya-pop-up__close-btn" ng-click="gallery.current_photo = null">X</span>
        <div class="ya-pop-up__content ya-clearfix" ng-click="$event.stopPropagation();">
            <div class="ya-span-3-4 ya-relative ya-pop-up__main">
                <div class="ya-pop-up-photo" ng-style="{'background-image':'url(' + photos[gallery.current_photo].image + ')'}" ng-click="turn_photo_right()">
                </div>
                <span class="ya-pop-up-photo__btn ya-pop-up-photo__btn_left" ng-click="turn_photo_left();"></span>
                <span class="ya-pop-up-photo__btn ya-pop-up-photo__btn_right" ng-click="turn_photo_right()"></span>
            </div>
            <div class="ya-span-1-4 ya-relative ya-pop-up__additional">
                <div class="ya-pop-up-comments">
                    <div class="ya-pop-up-comments__wrapper">
                        <div class="ya-wall__news-author ya-relative ya-clearfix">
                            <div class="ya-avatar ya-avatar_small ya-wall__avatar">
                                <img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                            </div>
                            <div class="ya-wall__news-info">
                                <div class="ya-wall__author-name">
                                    {{user.name + ' ' + user.surname}}
                                </div>
                                <div class="ya-wall__news-date">
                                    {{getDate(photos[gallery.current_photo].creDate)}}
                                </div>
                            </div>
                        </div>
                        <div class="ya-pop-up-comments__title">
                            {{photos[gallery.current_photo].title}}
                        </div>
                        <div class="ya-pop-up-comments__likes-wrapper">
                            <span class="ya-pop-up-comments__likes-link" ng-if="options.user">
									<span class="ya-pop-up-comments__likes" ng-click="like_photo()" ></span>
                            </span>
                            <span class="ya-pop-up-comments__likes-count" ng-if="options.user">
									{{photos[gallery.current_photo].likes.length}} Нравится
								</span>
                        </div>
                        <div class="ya-walls__comments">
                            <div class="ya-comments ya-comments_small">
                                <div class="ya-comments__list">
                                    <div class="ya-comments__item" ng-repeat="c in photos[gallery.current_photo].comments">
                                        <div class="ya-wall__news-author ya-relative ya-clearfix">
                                            <div class="ya-wall__news-remove" ng-if="c.userid === options.user._id" ng-click="remove_photo_comment(c.comment)">x</div>
                                            <div class="ya-avatar ya-avatar_small ya-wall__avatar">
                                                <img ng-src="{{c.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                                            </div>
                                            <div class="ya-wall__news-info">
                                                <div class="ya-wall__author-name">
                                                    {{c.name}} {{c.surname}}
                                                </div>
                                                <div class="ya-wall__news-date">
                                                    {{getDate(c.date)}}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="ya-wall__news-text">
                                            <pre>{{c.comment}}</pre>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <form ng-submit="add_photo_comment()" class="ya-comments__add-form ya-input">
                                <div class="ya-form__input ya-input ya-input_inline">
                                    <input type="text" ng-model="gallery.comment" placeholder="Комментировать" class="ya-comments__add-field ya-input__field">
                                </div>
                                <div class="ya-form__input ya-input ya-input_inline">
                                    <button type="submit" class="ya-btn ya-btn_primary ya-btn_small ya-btn_plus ya-btn_inline ya-new-post__btn">Комментировать</button>
                                </div>
                            </form>
                        </div>
                        <!--span>
							<i
								class="fa fa-lg"
								ng-if="options.userid === options.user._id"
								ng-click="set_avatar(photos[gallery.current_photo])"
								ng-class="{'fa-check-circle-o':photos[gallery.current_photo].image !== options.user.avatar,'fa-check-circle':photos[gallery.current_photo].image === options.user.avatar}"
							></i>
						</span-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>