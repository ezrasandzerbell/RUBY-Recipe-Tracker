# _RUBY Recipe App_

#### _Creates recipe collection database with details about ingredients and measurements_

#### By _**Ezra Sandzer-Bell**_

## Description

_This app is a two page site. On the first page, user enters a paragraph into first form and a keyword into second form. When submit button is clicked, user is taken to second page where the frequency (quantity) of keyword instances is displayed. Some CSS was added for aesthetic improvement, including a large "textarea" for the paragraph input. Site passes all integration specs._

## Installation

_1. In terminal, cd to project folder._
_2. $ rake db:create_
_3. $ rake db:migrate_
_4. $ rake db:test:prepare_
_5. $ ruby app.rb_
_6. navigate to localhost:4567_

## Features

* _App retrieves user input and displays in both ULs and dropdown menus_
* _When ingredient measurements are complete, user can create steps for the recipe_  

## Technologies Used

_This site was built with Ruby, ActiveRecord, Postgres HTML, and CSS. Temporary hosting and spec integration testing was performed with Sinatra_

### License

*Open Source*

Copyright (c) 2016 **_Ezra Sandzer-Bell_**
