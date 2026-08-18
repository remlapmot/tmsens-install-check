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
  if (Sys.info()["sysname"] == "Windows" && R.version$arch == "aarch64") {
    # Windows aarch64, CRAN does not build arm64 Windows binaries
    pak::repo_add(CRAN = "https://cran.r-universe.dev")
  } else {
    pak::repo_add(CRAN = "https://cloud.r-project.org")
    # pak::repo_add(universe = "https://mrcieu.r-universe.dev")
  }
  pak::pkg_install(c("tmsens"), dependencies = TRUE)
} else if (Sys.info()["machine"] == "x86_64") {
  pak::repo_add(CRAN = "https://p3m.dev/cran/__linux__/noble/latest")
  pak::repo_add(CRANbackup = "https://cloud.r-project.org")
  pak::pkg_install(c("tmsens"), dependencies = TRUE)
} else if (Sys.info()["machine"] == "aarch64") {
  # Linux aarch64
  rver <- format(getRversion()[, 1:2])
  pak::repo_add(
    CRAN = sprintf(
      "https://cran.r-universe.dev/bin/linux/noble-aarch64/%s",
      rver
    )
  )
  pak::repo_add(CRANbackup = "https://cloud.r-project.org")
  # pak::repo_add(universe = "https://mrcieu.r-universe.dev")
  pak::pkg_install("tmsens", dependencies = TRUE)
}

library(tmsens)

utils::sessionInfo()
