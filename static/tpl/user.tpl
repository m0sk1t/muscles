<article class="user-page">
	<section>
		<span class="avatar">
			<a href="#/options">
				<div>
					<img src="" alt="avatar">
				</div>
			</a>
			<div class="name">{{options.user.name}} {{options.user.surname}}</div>
			<div class="city">{{options.user.city}}</div>
			<span class="mark">&#9733; &#9733; &#9733; &#9733; &#9733;</span>
			<span ng-class="{fav: inFav()}">&#9825;</span>
			<div class="task">
				<label>
					<input type="checkbox" ng-if="classic_bb" ng-checked="classic_bb">
					Классический бодибилдинг
				</label>
				<label>
					<input type="checkbox" ng-if="crossfit" ng-checked="crossfit">
					Кроссфит
				</label>
				<label>
					<input type="checkbox" ng-if="fitness" ng-checked="fitness">
					Фитнесс
				</label>
			</div>
		</span>
		<span class="status-area">
			<div class="status-text">{{options.user.status}}</div>
			<div class="status">
				<label>
					<input type="checkbox" ng-if="classic_bb" ng-checked="classic_bb">
					Классический бодибилдинг
					<select name="" id="">
						<option value=""></option>
					</select>
				</label>
				<label>
					<input type="checkbox" ng-if="crossfit" ng-checked="crossfit">
					Кроссфит
					<select name="" id="">
						<option value=""></option>
					</select>
				</label>
				<label>
					<input type="checkbox" ng-if="fitness" ng-checked="fitness">
					Фитнесс
					<select name="" id="">
						<option value=""></option>
					</select>
				</label>
			</div>
			<div class="vacancies">
				<select name="" id="">
					<option value=""></option>
				</select>
				<select name="" id="">
					<option value=""></option>
				</select>
			</div>
			<div class="params">
				<span>
					<div>
						Возраст: {{getAge(options.user.birthDate)}}
					</div>
					<div>
						Рост: {{options.user.height}}
					</div>
					<div>
						Вес: {{options.user.weight}}
					</div>
				</span>
				<span>
					<div>
						Волосы: {{options.user.hairs}}
					</div>
					<div>
						Типаж: {{options.user.type}}
					</div>
				</span>
				<span>
					<div>
						Грудь: {{options.user.chest}}
					</div>
					<div>
						Талия: {{options.user.waist}}
					</div>
					<div>
						Бедра: {{options.user.huckle}}
					</div>
				</span>
				<label>
					Дата рождения
					<input type="date" ng-model="options.user.birthDate">
				</label><br>
			</div>
		</span>
		<span>
			<a href="#/dialogs" class="chat">
				<i class="fa fa-4x fa-comments-o"></i>
			</a>
			<div class="social">
				Подписчики
				<div class="fb">
					<i class="fa fa-3x fa-facebook-official"></i>
					<span class="fa fa-2x">14</span>
				</div>
				<div class="vk">
					<i class="fa fa-3x fa-vk"></i>
					<span class="fa fa-2x">13</span>
				</div>
				<div class="gp">
					<i class="fa fa-3x fa-google-plus-official"></i>
					<span class="fa fa-2x">12</span>
				</div>
				<div class="tw">
					<i class="fa fa-3x fa-twitter-square"></i>
					<span class="fa fa-2x">11</span>
				</div>
			</div>
		</span>
		<span class="media">
			<div class="photo">
				<a href="#/photos">
					<i class="fa fa-5x fa-camera"></i>
				</a>
			</div>
			<div class="video">
				<a href="#/videos">
					<i class="fa fa-5x fa-video-camera"></i>
				</a>
			</div>
			<div class="favs">
				<a href="#/favs">
					<i class="fa fa-5x fa-star-o"></i>
				</a>
			</div>
			<div class="work">
				Работа и образование
			</div>
		</span>
	</section>
	<h3>Достижения</h3>
	<section>
		<ul>
			<li>1 Место Мистер Иваново 2016</li>
			<li>2 Место Мистер Иваново 2015</li>
			<li>3 Место Мистер Иваново 2014</li>
		</ul>
	</section>
	<h3>Мои фото</h3>
	<section class="photos">
		<img src="" alt="img">
		<img src="" alt="img">
		<img src="" alt="img">
		<img src="" alt="img">
		<img src="" alt="img">
		<img src="" alt="img">
		<img src="" alt="img">
	</section>
	<h3>Мои записи</h3>
	<section>
		<div class="record">
			<div class="record-area">
				<img src="" alt="ava">
				<span class="record-text">text</span>
			</div>
			<div class="comments">
				<div class="comment">
					<img src="" alt="guest">
					<span class="comment-author">asd</span>
					<span class="comment-text">text</span>
				</div>
				<div class="comment">
					<img src="" alt="guest">
					<span class="comment-author">asd</span>
					<span class="comment-text">text</span>
				</div>
				<div class="comment">
					<img src="" alt="guest">
					<span class="comment-author">asd</span>
					<span class="comment-text">text</span>
				</div>
			</div>
		</div>
		<div class="record">
			<div class="record-area">
				<img src="" alt="ava">
				<span class="record-text">text</span>
			</div>
			<div class="comments">
				<img src="" alt="guest">
				<span class="comment-author">asd</span>
				<span class="comment-text">text</span>
			</div>
		</div>
		<div class="record">
			<div class="record-area">
				<img src="" alt="ava">
				<span class="record-text">text</span>
			</div>
			<div class="comments">
				<img src="" alt="guest">
				<span class="comment-author">asd</span>
				<span class="comment-text">text</span>
			</div>
		</div>
	</section>
</article>
