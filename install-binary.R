install.packages(
  "pak",
  repos = sprintf(
    "https://r-lib.github.io/p/pak/stable/%s/%s/%s",
    .Platform$pkgType,
    R.Version()$os,
    R.Version()$arch
  )
)

if (Sys.info()["sysname"] != "Linux") {
  # Windows and macOS
  pak::repo_add(CRAN = "https://cloud.r-project.org")
  # pak::repo_add(universe = "https://mrcieu.r-universe.dev")
  pak::pkg_install(c("tmsens"), dependencies = TRUE)
} else if (Sys.info()["machine"] == "x86_64") {
  # Linux x86_64
  if (getRversion() >= '4.5.0') {
    # pak::repo_add(universe = "https://mrcieu.r-universe.dev/bin/linux/noble/4.5/")
  } else if (getRversion() < '4.5.0') {
    # pak::repo_add(universe = "https://mrcieu.r-universe.dev/")
  }
  pak::repo_add(CRAN = "https://p3m.dev/cran/__linux__/noble/latest")
  pak::repo_add(CRANbackup = "https://cloud.r-project.org")
  pak::pkg_install(c("tmsens"), dependencies = TRUE)
} else if (Sys.info()["machine"] == "aarch64") {
  # Linux aarch64
  pak::repo_add(CRAN = "https://cloud.r-project.org")
  # pak::repo_add(universe = "https://mrcieu.r-universe.dev")
  pak::pkg_install(c("tmsens"), dependencies = TRUE)
}

library(tmsens)

utils::sessionInfo()
