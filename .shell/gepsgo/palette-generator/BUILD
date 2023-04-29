subinclude("@gbs//toolchain/golang:golang.plz")
subinclude("@gbs//dev:dev.plz")


ge_golang_console_binary(
  "palette-generator",
  srcs=glob(["*.go"]),
  deps=[
    "//gepsgo/colors",
  ],
  static=False,
)

###########################################################
# dev-mode
###########################################################

ge_dev_run(
  name="dev",
  cmd="""
    $(out_exe :palette-generator)
  """,
  deps=[
    ":palette-generator",
  ],
  restart_on_changes=True,
)

ge_dev_watch(
  name="watch",
  deps=[
    "//gepsgo/palette-generator:dev",
  ],
)
