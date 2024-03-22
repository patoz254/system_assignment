#!/bin/bash

# Prompting the user to enter employee details
read -p "Enter Employee Name: " employeeName
read -p "Enter Hours Worked: " hoursWorked
read -p "Enter Rate Per Hour: " ratePerHour

# Calculate basic pay
basicPay=$((hoursWorked * ratePerHour))

# Function to calculate tax based on basic pay
calculate_tax() {
    local basicPay=$1
    local tax=0

    if [ $basicPay -gt 70000 ]; then
        tax=$((basicPay * 25 / 100))
    elif [ $basicPay -ge 15000 ] && [ $basicPay -le 70000 ]; then
        tax=$((basicPay * 15 / 100))
    else
        tax=0
    fi

    echo $tax
}

# Calculate tax
taxAmount=$(calculate_tax $basicPay)

# Displaying the result
echo "Employee Name: $employeeName"
echo "Hours Worked: $hoursWorked"
echo "Rate Per Hour: $ratePerHour"
echo "Basic Pay: $basicPay"
echo "Tax Amount: $taxAmount"
