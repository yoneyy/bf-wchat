{
  "targets": [
    {
      "target_name": "bf-wchat",
      "cflags!": [ "-fno-exceptions" ],
      "cflags_cc!": [ "-fno-exceptions" ],
      "libraries": ["<(module_root_dir)/lib/libWeWorkFinanceSdk_C.so"],
      "sources": ["wework_chat.cpp", "include/WeWorkFinanceSdk_C.h"],
      "include_dirs": [
        "./include/**/*",
        "<!@(node -p \"require('node-addon-api').include\")",
      ],
      'defines': [ 'NAPI_DISABLE_CPP_EXCEPTIONS' ]
    }
  ]
}