**Abandoned. Check the [OpenEuropa project](https://github.com/openeuropa/openeuropa) for more information.**

# Installation profile

Basic installation profile, all it does is:

1. Enable the bare minimum amount of core modules.
2. Setup `seven` as administrative theme and `classy` as front-end theme.
3. Enable `oe_core` module.

All business critical functionality are deferred to the `oe_core` module.

## Rationale

Opting for a minimalistic installation profile will make it easier to deal with a fully distributed approach: the
installation profile is seen as an empty shell that will never pose any compatibility issue to any of the site's modules
and themes. Most importantly this will allow modules and themes maintainers to properly version their work semantically.
