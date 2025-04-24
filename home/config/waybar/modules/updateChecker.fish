#!/usr/bin/env fish

# This script assumes your flake is in ~/.dotfiles and that your flake's
# nixosConfigurations is named the same as your hostname ($hostname in Fish).

# Define the dotfiles directory
set dotfiles_dir ~/.dotfiles

# Attempt to update flake lock, build, and get diff lines
# Use 'command' to ensure we run the external commands, not potential aliases/functions
# Use 'and' to chain commands; stop if any command fails
# Capture only the update lines from nvd diff
set update_lines (cd $dotfiles_dir; and \
                    command nix flake lock --update-input nixpkgs; and \
                    command nix build --no-link .#nixosConfigurations.$hostname.config.system.build.toplevel; and \
                    command nvd diff /run/current-system $dotfiles_dir/result | command grep -e '\[U')

# Check the exit status of the last command pipeline
if test $status -ne 0
    # If any command failed, output an error JSON and exit
    echo '{ "text": "ERR", "alt": "error", "tooltip": "Error checking NixOS updates (status: '$status')" }'
    exit 1
end

# Count the number of update lines captured
# Use 'echo -n' to avoid adding a newline, ensuring wc -l gives 0 for empty input
set updates (echo -n $update_lines | command wc -l)

# Determine alt text and tooltip based on the update count
if test $updates -eq 0
    set alt "updated"
    set tooltip "System updated"
else
    set alt "has-updates"
    # Format the captured lines into the tooltip
    # awk script extracts package names/versions
    # ORS='\\n' adds literal '\n' for newlines within the JSON tooltip string
    set tooltip (echo -n $update_lines | command awk '{ for (i=3; i<NF; i++) printf $i " "; if (NF >= 3) print $NF; }' ORS='\\n')
end

# Output the JSON string for Waybar/other status bars
# Use double quotes for variable expansion
echo "{ \"text\":\"$updates\", \"alt\":\"$alt\", \"tooltip\":\"$tooltip\" }"

# Optional: clean up the build result link if not needed elsewhere
# command rm -f $dotfiles_dir/result
