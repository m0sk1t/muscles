<article>
	<section>
		<div>Фотографии в альбоме {{album.title}}</div>
		<div class="photos">
			<div
				class="photo"
				ng-repeat="p in photos track by $index"
			>
				<img ng-src="{{p.image}}" ng-click="gallery.current = $index">
				<span>
					<i
						class="fa fa-lg fa-trash"
						ng-click="delete_photo(p._id)"
						ng-if="options.user._id === p.owner"
					></i>
					<i
						class="fa fa-lg fa-edit"
						ng-click="editedPhoto = p;"
						ng-if="options.user._id === p.owner"
					></i>
					<i class="fa fa-lg fa-heart-o"></i>
					<i class="fa fa-lg fa-comment"></i>{{p.comments.length}}
					{{::p.title}}
				</span>
			</div>
		</div>
	</section>
	<section class="gallery" ng-hide="gallery.current === null">
		<div class="photo-area">
			<span
				class="left"
				ng-click="turnLeft();"
			>
				&lt;
			</span>
			<span class="photo">
				<span ng-click="gallery.current = null">X</span>
				<img ng-src="{{photos[gallery.current].image}}">
			</span>
			<span
				class="right"
				ng-click="turnRight()"
			>
				&gt;
			</span>
		</div>
	</section>
</article>
