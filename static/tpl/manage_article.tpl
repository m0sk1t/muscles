<article>
    <section>
        <p>
            <button ng-click="update_article();">Save</button>
        </p>
        <p>
            Заголовок <input type="text" ng-model="article.title" placeholder="Заголовок"><br />
        </p>
        <p>
            Описание <input type="text" ng-model="article.description" placeholder="Описание"><br />
        </p>
        <p>
            Вид спорта
            <select ng-model="article.sport">
                <option ng-repeat="s in sports">{{s.sport}}</option>
            </select>
        </p>
        <p>
            Тема
            <select ng-model="article.theme">
                <option ng-repeat="t in themes">{{t.title}}</option>
            </select>
        </p>
        <p>
            <textarea froala="froalaOptions" ng-model="article.text"><textarea>
		</p>
	</section>
</article>