<article>
	<section>
		<div>{{options.user._id === options.userid?'Мои видео':'Видео пользователя'}}
			<span
				class="add-video"
				ng-if="options.user._id === options.userid"
				ng-click="layer.addVideo = {link:'',title:''}"
			>
				Добавить видео
			</span>
		<div class="videos">
			<div
				ng-repeat="v in videos track by $index"
			>
				<div ng-click="gallery.current = $index">Развернуть</div>
				<iframe ng-if="v.type==='vimeo'" width="310" height="255" ng-src="{{include_video('vimeo', v.link)}}" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>
				<iframe ng-if="v.type==='youtube'" width="310" height="255" ng-src="{{include_video('youtube', v.link)}}" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>
				<div>
					<i
						class="fa fa-lg fa-trash"
						ng-click="delete_video(v._id)"
						ng-if="options.user._id === v.owner"
					></i>
					<i
						class="fa fa-lg fa-edit"
						ng-click="layer.editedVideo = v;"
						ng-if="options.user._id === v.owner"
					></i>
					<span ng-if="options.user">
						<i
							ng-click="like(v, $index)"
							class="fa fa-lg fa-heart-o"
						></i>{{v.likes.length}}
					</span>
					<span ng-if="options.user">
						<i
							class="fa fa-lg fa-comment"
						></i>{{v.comments.length}}
					</span>
					{{::v.title}}
				</div>
			</div>
		</div>
	</section>
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
			<input type="text" placeholder="Ссылка на видео" ng-model="layer.editedVideo.link">
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
				</span>
			<span
				class="right"
				ng-click="turn_right()"
			>
				&gt;
			</span>
		</div>
	</section>
</article>
