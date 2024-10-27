# Publicar atualizar manualmente GitHub Pages

````bash
git branch -D gh-pages  

git push origin --delete gh-pages  
  
git checkout --orphan gh-pages  

git add -f  netflix_project/target  
  
git subtree push --prefix target origin gh-pages  

git subtree push --prefix netflix_project/target origin gh-pages  

git checkout main  
```
# Referencia
https://medium.com/dbt-local-taiwan/host-dbt-documentation-site-with-github-pages-in-5-minutes-7b80e8b62feb
