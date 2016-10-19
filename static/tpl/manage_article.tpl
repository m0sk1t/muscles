<article>
	<section>
		<p>
			<button ng-click="update_article();">Save</button>
		</p>
		<p>
			<input type="text" ng-model="article.title" placeholder="Заголовок"><br />
		</p>
		<p>
			<textarea froala="froalaOptions" ng-model="article.text"><textarea>
		</p>
	</section>
</article>
