#!/usr/bin/env python3

import subprocess

def get_profiles():
    result = subprocess.run(['powerprofilesctl', 'list'], capture_output=True, text=True, check=True)
    profiles = [line.split(':')[0].strip() for line in result.stdout.strip().splitlines()]
    return profiles

def get_current_profile():
    result = subprocess.run(['powerprofilesctl', 'get'], capture_output=True, text=True, check=True)
    return result.stdout.strip()

def set_profile(profile):
    try:
        subprocess.run(['powerprofilesctl', 'set', profile], check=True)
        subprocess.run(['notify-send', 'Power Profile', f'Set to: {profile}'], check=True)
    except subprocess.CalledProcessError as e:
        subprocess.run(['notify-send', 'Error', f'Failed to set profile: {e}'], check=True)

if __name__ == "__main__":
    profiles = get_profiles()
    current_profile = get_current_profile()

    wofi_options = []
    for profile in profiles:
        if profile == current_profile:
            wofi_options.append(f"{profile} (Active)")
        else:
            wofi_options.append(profile)

    wofi_input = "\n".join(wofi_options)
    wofi_process = subprocess.run(['wofi', '--show', 'dmenu', '--prompt', 'Power Profile:'], input=wofi_input.encode(), capture_output=True, text=True)
    selected = wofi_process.stdout.strip()

    if selected:
        selected_profile = selected.replace(" (Active)", "")
        if selected_profile in profiles:
            set_profile(selected_profile)
        else:
            subprocess.run(['notify-send', 'Power Profile', 'Invalid selection.'], check=True)
