// @activeadmin/activeadmin's precompiled UMD bundle only requires jquery-ui's
// widget/datepicker/dialog/sortable/tabs and jquery-ujs through a CommonJS
// branch (`typeof exports === "object" && typeof module !== "undefined"`)
// that never fires in a plain IIFE bundle (no global exports/module) — it
// silently falls through to the "browser global" branch instead, which
// skips requiring all of those. So we import the whole jquery-ui dependency
// graph ourselves, in topological order (each file's own "Browser globals"
// fallback assumes its dependencies already ran).
import "jquery-ui/ui/version"
import "jquery-ui/ui/widget"
import "jquery-ui/ui/keycode"
import "jquery-ui/ui/unique-id"
import "jquery-ui/ui/focusable"
import "jquery-ui/ui/tabbable"
import "jquery-ui/ui/position"
import "jquery-ui/ui/data"
import "jquery-ui/ui/scroll-parent"
import "jquery-ui/ui/plugin"
import "jquery-ui/ui/disable-selection"
import "jquery-ui/ui/widgets/mouse"
import "jquery-ui/ui/widgets/controlgroup"
import "jquery-ui/ui/widgets/checkboxradio"
import "jquery-ui/ui/widgets/button"
import "jquery-ui/ui/widgets/draggable"
import "jquery-ui/ui/widgets/resizable"
import "jquery-ui/ui/widgets/sortable"
import "jquery-ui/ui/widgets/dialog"
import "jquery-ui/ui/widgets/tabs"
import "jquery-ui/ui/widgets/datepicker"
import "jquery-ujs"

import "@activeadmin/activeadmin"
