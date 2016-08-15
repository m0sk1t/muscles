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
					<i class="fa fa-lg fa-trash" ng-click="delete_photo(p._id)"></i>
					<i class="fa fa-lg fa-edit" ng-click="editedPhoto = p;"></i>
					<i class="fa fa-lg fa-heart-o"></i>
					<i class="fa fa-lg fa-comment"></i>
					{{::p.title}}
				</span>
			</div>
		</div>
	</section>
	<section class="gallery">
		<div class="photo-area">
			<span
				class="left"
				ng-click="turnLeft();"
			>
				&lt;
			</span>
			<span class="photo"><img ng-src="{{photos[gallery.current].image}}"></span>
			<span
				class="right"
				ng-click="turnRight()"
			>
				&gt;
			</span>
		</div>
	</section>
</article>
