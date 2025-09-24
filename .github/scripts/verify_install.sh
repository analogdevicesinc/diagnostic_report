#!/bin/bash

install_location="${1:-/usr}"

if [ ! -d "$install_location/share/adi_diagnostic_report/" ] || \
    [ ! -d "$install_location/share/applications" ]; then
        echo "Installation directories not found!"
        exit 1
fi

if [ ! -f "$install_location/bin/adi_diagnostic_report" ] || \
    [ ! -f "$install_location/share/adi_diagnostic_report/adi_diagnostic_report.glade" ] || \
    [ ! -f "$install_location/share/applications/adi-diagnostic-report.desktop" ]; then
        echo "Installation files not found!"
        exit 1
fi

echo "Diagnostic Report installed successfully."

