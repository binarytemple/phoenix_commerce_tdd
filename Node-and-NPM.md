Weird Javascript errors, front end phoenix_html not working correctly... 

https://github.com/phoenixframework/phoenix/issues/1410

Solution.. 

```
rm -rf ~/.npm node_modules
npm install npm -g
npm install && node node_modules/brunch/bin/brunch build
```
