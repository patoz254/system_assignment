#!/bin/bash

# Prompting the user to enter customer details
read -p "Enter Customer ID: " customerId
read -p "Enter Customer Name: " customerName
read -p "Enter Units Consumed: " unitsConsumed

# Function to calculate bill based on units consumed
calculate_bill() {
    local units=$1
    local charge=0

    if [ $units -lt 200 ]; then
        charge=$((units * 120))
    elif [ $units -ge 200 ] && [ $units -lt 400 ]; then
        charge=$((200 * 120 + (units - 200) * 150))
    elif [ $units -ge 400 ] && [ $units -lt 600 ]; then
        charge=$((200 * 120 + 200 * 150 + (units - 400) * 180))
    else
        charge=$((200 * 120 + 200 * 150 + 200 * 180 + (units - 600) * 200))
    fi

    echo $charge
}

# Calculate total bill
totalBill=$(calculate_bill $unitsConsumed)

# Displaying the bill
echo "Customer ID: $customerId"
echo "Customer Name: $customerName"
echo "Units Consumed: $unitsConsumed"
echo "Total Bill: $totalBill Ksh"
