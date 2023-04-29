subinclude("@gbs//toolchain/golang:golang.plz")

ge_golang_console_binary(
  name="gepsgo",
  srcs=glob([
    "*.go",
  ]),
  deps=[
    "//gepsgo/colors",
  ],
  static=False,
)
