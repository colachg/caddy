package main

import (
	"github.com/caddyserver/caddy/caddy/caddymain"
	
	// plug in plugins here, for example:
	// _ "import/path/here"
	_ "github.com/caddyserver/dnsproviders/dnspod"
	_ "github.com/caddyserver/dnsproviders/alidns"
	_ "github.com/caddyserver/dnsproviders/cloudflare"
)

func main() {
	// optional: disable telemetry
	caddymain.EnableTelemetry = false
	caddymain.Run()
}

