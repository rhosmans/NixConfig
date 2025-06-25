WS=$(hyprctl clients -j | jq -r '.[] | select(.class | test("zen-beta")) | .workspace.id' | head -n1)
[ -n "$WS" ] && hyprctl dispatch workspace "$WS"
exec zen "$@"
