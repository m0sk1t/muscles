<article>
    <section>
        <p>
            <button ng-click="update_article();">Save</button>
        </p>
        <p>
            <input type="text" ng-model="article.title" placeholder="Заголовок"><br />
        </p>
        <p>
            <input type="text" ng-model="article.description" placeholder="Описание"><br />
        </p>
        <p>
            <select ng-model="article.sport">
                <option ng-repeat="s in sports">{{s.sport}}</option>
            </select>
        </p>
        <p>
            <select ng-model="article.theme">
                <option ng-repeat="t in themes">{{t.title}}</option>
            </select>
        </p>
        <p>
            <textarea froala="froalaOptions" ng-model="article.text"><textarea>
		</p>
	</section>
</article>