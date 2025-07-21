function macos_use_touch_id_for_sudo
    # Adds the following line right after the first comment of /etc/pam.d/sudo:
    # auth       sufficient     pam_tid.so
    if not test "$(uname)" = "Darwin"
        echo "This script is only for macOS."
        exit 1
    end
    set -l file_to_change /etc/pam.d/sudo
    set -l expected_hash "6dea54fbd8bc06ade4b4ff7ff4abd185cb549e59b9444222d60c8ad983048c93a4a55683a267db2dac1acf770cd8db6a93c0fc948aea91abfee8f53e42344a72  $file_to_change"
    set -l current_hash (shasum -a 512 $file_to_change)
    if not test "$current_hash" = "$expected_hash"
        echo "File $file_to_change has been changed after the latest revision if this script. Aborting"
        exit 2
    end
    sudo cp $file_to_change ~/.config/fish/functions/sudo.bak
    sudo sed -i '' 's@# sudo: auth account password session@# sudo: auth account password session\nauth       sufficient     pam_tid.so@g' $file_to_change
    echo "The changes will take effect after the next login."
end
