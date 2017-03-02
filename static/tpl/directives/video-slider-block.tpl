<div class="ya-pop-up ya-pop-up_table ya-pop-up_active" ng-click="gallery.current_video = null">
    <div class="ya-pop-up__wrapper">
        <span class="ya-pop-up__close-btn" ng-click="gallery.current_video = null">X</span>
        <div class="ya-pop-up__content ya-clearfix" ng-click="$event.stopPropagation();">
            <div class="ya-span-3-4 ya-relative ya-pop-up__main">
                <div class="ya-pop-up__table">
                    <div class="ya-pop-up__cell">
                        <iframe ng-if="videos[gallery.current_video].type==='vimeo'" width="640" height="480" ng-src="{{include_video('vimeo', videos[gallery.current_video].link)}}" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>
                        <iframe ng-if="videos[gallery.current_video].type==='youtube'" width="640" height="480" ng-src="{{include_video('youtube', videos[gallery.current_video].link)}}" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>
                        <span class="ya-pop-up-photo__btn ya-pop-up-photo__btn_left" ng-click="turn_video_left();">
						</span>
                        <span class="ya-pop-up-photo__btn ya-pop-up-photo__btn_right" ng-click="turn_video_right();">
						</span>
                    </div>
                </div>
            </div>
            <div class="ya-span-1-4 ya-relative ya-pop-up__additional">
                <div class="ya-pop-up-comments">
                    <div class="ya-pop-up-comments__wrapper">
                        <div class="ya-wall__news-author ya-relative ya-clearfix">
                            <!--div class="ya-avatar ya-avatar_small ya-wall__avatar">
                                <img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                            </div-->
                            <div class="ya-avatar ya-avatar_small ya-wall__avatar" ng-style="{'background-image':'url(' + (user.avatar || '/images/avatar.jpg') + ')'}"></div>
                            <div class="ya-wall__news-info">
                            <div class="ya-wall__news-info">
                                <div class="ya-wall__author-name">
                                    {{user.name + ' ' + user.surname}}
                                </div>
                                <div class="ya-wall__news-date">
                                    {{getDate(videos[gallery.current_video].creDate)}}
                                </div>
                            </div>
                        </div>
                        <div class="ya-pop-up-comments__title">
                            {{videos[gallery.current_video].title}}
                        </div>
                        <div class="ya-pop-up-comments__likes-wrapper">
                            <span class="ya-pop-up-comments__likes-link" ng-if="options.user">
							<span
								class="ya-pop-up-comments__likes"
								ng-click="like_video()"
							></span>
                            </span>
                            <span class="ya-pop-up-comments__likes-count" ng-if="options.user">
							{{videos[gallery.current_video].likes.length}} Нравится
						</span>
                        </div>
                        <div class="ya-walls__comments">
                            <div class="ya-comments ya-comments_small">
                                <div class="ya-comments__list">
                                    <div class="ya-comments__item" ng-repeat="c in videos[gallery.current_video].comments">
                                        <div class="ya-wall__news-author ya-relative ya-clearfix">
                                            <div class="ya-wall__news-remove" ng-if="c.userid === options.user._id" ng-click="remove_video_comment(c.comment)">x</div>
                                            <!--div class="ya-avatar ya-avatar_small ya-wall__avatar">
                                                <img ng-src="{{c.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                                            </div-->
                                            <div class="ya-avatar ya-avatar_small ya-wall__avatar" ng-style="{'background-image':'url(' + (c.avatar || '/images/avatar.jpg') + ')'}"></div>
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
                            <form ng-submit="add_video_comment()" class="ya-comments__add-form ya-input">
                                <div class="ya-form__input ya-input ya-input_inline">
                                    <input type="text" ng-model="gallery.comment" placeholder="Комментировать" class="ya-comments__add-field ya-input__field">
                                </div>
                                <div class="ya-form__input ya-input ya-input_inline">
                                    <button class="ya-btn ya-btn_primary ya-btn_small ya-btn_plus ya-btn_inline ya-new-post__btn">Комментировать</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>