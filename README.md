# old_r_example

1. Clone this repo to your local machine using `git clone https://github.com/ajstewartlang/old_r_example.git`

2. Open the `script.Rmd` file in your version of RStudio.

3. Knit the `.Rmd` file as an HTML document.

4. Does your HTML document look like the file `original_markdown.html`?

By editing the code, can you make our output match the original?

On your machine, build a Docker image from the cloned repo using `docker build -t old_r_example .` and run it with `docker run --rm -p 8787:8787 -v /home/rstudio/ -e PASSWORD=password old_r_example`. In your Docker container, knit the `.Rmd` file. Does the HTML now look like `original_markdown.html`?
