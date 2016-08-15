<article>
	<section>
		<div>
			Мои альбомы
			<span class="create-album" ng-click="createAlbum()">
				Создать альбом
			</span>
		</div>
		<div class="albums">
			<div
				class="album"
				ng-repeat="a in albums"
			>
				<a href="#/album/{{a._id}}">
					<img ng-src="{{a.cover.image}}">
					{{::a.title}}
				</a>
				<span>
					<i class="fa fa-lg fa-trash" ng-click="delete_album(a._id)"></i>
					<i class="fa fa-lg fa-edit" ng-click="layer.editedAlbum = a"></i>
				</span>
			</div>
		</div>
	</section>
	<section>
		<div>Мои фотографии</div>
		<div
			class="drop-box"
			ngf-multiple="true"
			ngf-pattern="'image/*'"
			ngf-drop="uploadFiles($files)"
			ngf-drag-over-class="'dragover'"
			ngf-select="uploadFiles($files)"
		>
			Бросьте сюда картинки либо кликните
		</div>
		<div class="photos">
			<div
				class="photo"
				ng-repeat="p in photos"
			>
				<img ng-src="{{p.image}}">
				<span>
					<i class="fa fa-lg fa-trash" ng-click="delete_photo(p._id)"></i>
					<i class="fa fa-lg fa-edit" ng-click="layer.editedPhoto = p;"></i>
					<i class="fa fa-lg fa-heart-o" ng-click="like_photo()"></i>{{p.likes.length}}
					<i class="fa fa-lg fa-comment"></i>{{p.comments.length}}
					{{::p.title}}
				</span>
			</div>
		</div>
	</section>
	<section class="edit-photo" ng-class="{hide: layer.editedPhoto == null, show: layer.editedPhoto != null}">
		<div>
			<input type="text" placeholder="Название фото" ng-model="layer.editedPhoto.title">
			<select ng-model="layer.editedPhoto.album">
				<option ng-value="al._id" ng-repeat="al in albums">{{al.title}}</option>
			</select>
			<button ng-click="layer.editedPhoto = null;">Отменить!</button>
			<button ng-click="edit_photo(layer.editedPhoto)">Сохранить!</button>
		</div>
	</section>
	<section class="edit-album" ng-class="{hide: layer.editedAlbum == null, show: layer.editedAlbum != null}">
		<div>
			<input type="text" placeholder="Название альбома" ng-model="layer.editedAlbum.title">
			<button ng-click="layer.editedAlbum = null;">Отменить!</button>
			<button ng-click="edit_album(layer.editedAlbum)">Сохранить!</button>
		</div>
	</section>
</article>
