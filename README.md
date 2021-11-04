<p align="center">
    <img src="https://raw.githubusercontent.com/Clivern/Muffin/main/assets/logo.png?v=0.1.3" width="240" />
    <h3 align="center">Muffin</h3>
    <p align="center">Multi-Language Coding Playground Platform.</p>
    <p align="center">
        <a href="https://github.com/Clivern/Muffin/actions/workflows/build.yml">
            <img src="https://github.com/Clivern/Muffin/actions/workflows/build.yml/badge.svg">
        </a>
        <a href="https://github.com/Clivern/Muffin/releases">
            <img src="https://img.shields.io/badge/Version-0.1.4-red.svg">
        </a>
        <a href="https://github.com/Clivern/Muffin/blob/master/LICENSE">
            <img src="https://img.shields.io/badge/LICENSE-MIT-cyan.svg">
        </a>
    </p>
</p>
<br/>

## Documentation

### Getting Started

In order to run `muffin`, you need `ruby` `>=` `2.7.4` and `nodejs`. Then run the following commands:

```zsh
$ gem install bundler

$ make setup
```

To run the application:

```zsh
$ cp .env .env.local
# Then adjust .env.local
$ source .env.local
$ export $(cut -d= -f1 .env.local)

$ make run
```

To run test cases:

```zsh
$ make ci
```

To list all commands:

```zsh
$ make
```


## Versioning

For transparency into our release cycle and in striving to maintain backward compatibility, Muffin is maintained under the [Semantic Versioning guidelines](https://semver.org/) and release process is predictable and business-friendly.

See the [Releases section of our GitHub project](https://github.com/clivern/muffin/releases) for changelogs for each release version of Muffin. It contains summaries of the most noteworthy changes made in each release.


## Bug tracker

If you have any suggestions, bug reports, or annoyances please report them to our issue tracker at https://github.com/clivern/muffin/issues


## Security Issues

If you discover a security vulnerability within Muffin, please send an email to [hello@clivern.com](mailto:hello@clivern.com)


## Contributing

We are an open source, community-driven project so please feel free to join us. see the [contributing guidelines](CONTRIBUTING.md) for more details.


## License

© 2021, Clivern. Released under [MIT License](https://opensource.org/licenses/mit-license.php).

**Muffin** is authored and maintained by [@clivern](http://github.com/clivern).
