<article>
	<section>
		<div>Фотографии в альбоме {{album.title}}</div>
		<div class="photos">
			<div
				class="photo"
				ng-repeat="p in photos"
			>
				<img ng-src="{{p.image}}">
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
</article>
