<article>
	<section>
		<div
			class="drop-box"
			ngf-multiple="true" 
			ngf-drop="uploadFiles($files)"
			ngf-drag-over-class="'dragover'"
			ngf-select="uploadFiles($files)"
			ngf-pattern="'image/*,application/pdf'"
		>
			Drop Images or PDFs files here
		</div>
		<div class="photos">
			<div
				class="photo"
				ng-repeat="p in photos"
			>
				<img ng-src="{{p.image}}">
				<span>
					<i class="fa fa-lg fa-trash" ng-click="delete_photo(p._id)"></i>
					<i class="fa fa-lg fa-edit"></i>
					<i class="fa fa-lg fa-heart-o"></i>
					<i class="fa fa-lg fa-comment"></i>
					{{::p.title}}
				</span>
			</div>
		</div>
	</section>
</article>
