return {
	type = "value",
	description = [[Controls how this modifer affects the particles. Spherical modifer operates around the point defined by `.position` property. Cylindrical modifer applied the force parallel to the `.direction` vector, centered at `position` property. Planar modifers operate perpendicular to the `.direction` vector.

Maps to values in [`ni.particleBombSymmetryType`](https://mwse.github.io/MWSE/references/ni/particle-bomb-symmetry-types/) table.]],
	valuetype = "ni.particleBombSymmetryType",
}
