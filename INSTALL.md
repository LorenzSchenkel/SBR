# Installation instructions

As long as this bundle is not yet available via CTAN the most simple way to nstall it is using l3build.

This file describes a mehanism to test the bundle without installation and also the necessary steps to install it for a single user account.

Ths setup requires a current version of a TeX Distribution (we recommend TeX Live).

## Test without install

l3build provdes the possibility to try a package sandboxed. To build the demo files you can run

```

l3build doc
```

within the root directory of the project. This would copy all required files and type set demo files within `build/doc`.

After the process is finished you find the generated PDF-files at `build/doc/DEMO-*.pdf`.

## Non-root installation using l3build

[l3build](https://ctan.org/pkg/l3build) provides the functionality to unpack and install a package using a build script.
By default this would use the `$TEXMFHOME` variable as the prefered location.
In case you are using MikTeX this variable usually does not exist, see the [MikTeX speficic instructions](#installation-within-miktex).

To install the bundle for your own user run

```
l3build install
```

within the repositories root directory.

This unpack the bundle and copy all necessary files to be accessed by the LaTeX compiler to your users texmf tree.

#TOOD check? You don't have to manually install any files. The bundle includes the logos and font files.

After finishing the installation you should be able to typeset the `*.tex` files from the `examples` directory and create your own documents based on those.

Please be aware that the font setup will require you to use `lualatex`.

### Installation within MikTeX (not recommended)

MikTeX lacks the `$TEXMFHOME` variable. Therefor it is necessary to select the directory `l3build` should use.

One directory which would match would be so valle `UserInstall` directory or an additional texmf root.

The location differs depending on your OS, as described at https://miktex.org/kb/texmf-roots

- [Windows] `%USERPROFILE%\Roaming\MiKTeX\2.9`
- [Linux] `$HOME/.miktex/texmfs/install`
- [MacOS] `$HOME/Library/Application Support/MiKTeX/texmfs/install`

This path can be used as value for `-texmfhome` for `l3build`:

```
l3build install --texmfhome <value of UserInstall as configured in your installation or as shown above>
mktexlsr
```

The mktexlsr command is required as MikTeX does not not-indexed directorie, so the files are registered to be found by the LaTex compiler.