# Vendored Data

> [!WARNING]
> NOT CURRENTLY SECURED!
>
> Data here contains, among other things, executable artifacts.
> These are currently configured for sandboxed environments, not
> for production or open environments. Exposing their unrestricted range
> of capabilities to whatever environment they are deployed to.

This is data that is under consideration for preloading into the Content Addressable Storage.
Examples includes administrative UIs. These are vendored, meaning they are included here, in their entirety,
as Git submodules. Allowing us easy access to perform surgical modification through a local branch which we
are commiting to, and rebasing from upstream as warranted. We are not considering doin major rewrites to them,
nor any actual bug fixing (unless we absolutely have too).

The most standard thing you'll likely see is the addition of Nix and container related files.
Done to lock down their dependencies along with providing an easy way to extract usable artifacts in a standardized format.
