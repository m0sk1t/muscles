<article>
	<section>
		<span class="favs">
			<div class="fav-user" ng-repeat="f in favs">
				<span class="avatar">
					<img ng-src="{{f.avatar}}" alt="ava">
				</span>
				<span>
					<div class="bio">
						<span>{{f.name}} {{f.surname}}, {{f.city}}</span>
						<span class="in-fav">V</span>
					</div>
					<div class="fav-actions">
						<div class="write-message">НАПИСАТЬ Сообщение</div>
						<div class="write-comment">оставить комментарий</div>
						<div class="del-from-fav">удалить из избранных</div>
					</div>
				</span>
			</div>
		</span>
	</section>
</article>
