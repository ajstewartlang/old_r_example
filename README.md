# old_r_example

1. Clone this repo to your local machine using `git clone`.

2. Open the script.Rmd file in your version of RStudio.

3. Knit the .Rmd file as an HTML document.

4. Does your HTML document look like the file `original_markdown.html`?

Note, the package `lsmeans` was renamed as `emmeans`. Try changing that in the .Rmd file and reknitting. Does your new HTML file now look like `original_markdown.html`?

On your machine, build a Docker image from the cloned repo using `docker build -t old_r_example .` and run it with `docker run --rm -p 8787:8787 -v /home/rstudio/ -e PASSWORD=password old_r_example`. In your Docker container, knit the .Rmd file. Does the HTML now look like `original_markdown.html`?
