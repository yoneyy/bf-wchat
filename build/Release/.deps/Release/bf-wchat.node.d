cmd_Release/bf-wchat.node := ln -f "Release/obj.target/bf-wchat.node" "Release/bf-wchat.node" 2>/dev/null || (rm -rf "Release/bf-wchat.node" && cp -af "Release/obj.target/bf-wchat.node" "Release/bf-wchat.node")
