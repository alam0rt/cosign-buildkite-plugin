# cosign buildkite plugin

Sign your images & commits using cosign!

## Example

Add the following to your `pipeline.yml`:

```yml
steps:
  - command: kubectl set image deployment example app=$BUILDKITE_PLUGIN_COSIGN_IMAGE
    plugins:
      - alam0rt/cosign#v1.0.0:
          image: 'samlockart/plugin-tester:v1.0.0'
          mode: verify
          require:
            - scanned

```

## Configuration

### `image` (Required, string)

The file name pattern, for example `*.ts`. Supports any pattern supported by [find -name](http://man7.org/linux/man-pages/man1/find.1.html).

## Developing

To run the tests:

```shell
docker-compose run --rm tests
```

## Contributing

1. Fork the repo
2. Make the changes
3. Run the tests
4. Commit and push your changes
5. Send a pull request
