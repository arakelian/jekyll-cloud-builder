# jekyll-cloud-builder

This docker image will build [Jekyll](https://jekyllrb.com/) sites on the [Google Cloud Builder](https://cloud.google.com/container-builder/docs/) platform.  It can also be used manually to build a Jekyll site using Docker.

Inspired by [Gordon Leigh](https://github.com/gordonmleigh/jekyll-cloud-builder).

## Manual usage

```bash
docker run -v "$PWD":/workspace --rm arakelian/jekyll-cloud-builder:latest
```

## cloudbuild.yaml

The following example builds a static website and uploads it to Google Cloud Storage, where it can be served directly.  To get started, first create a bucket for your domain as described in [Hosting a static website](https://cloud.google.com/storage/docs/hosting-static-website).

```yaml
steps:
- name: arakelian/jekyll-cloud-builder:latest
- name: gcr.io/cloud-builders/gcloud
  entrypoint: gsutil
  args: ["-m", "rsync", "-r", "-c", "-d", "./_site", "gs://example.com"]
```

