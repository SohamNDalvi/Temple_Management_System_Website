<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expenses Management</title>
</head>
<body>
    <h1>Add Expenses</h1>

    <script>
        // Function to handle form submission
        function submitExpenses() {
            var productName = prompt("Enter Product Name:");
            if (!productName) return; // Exit if cancelled

            var date = prompt("Enter Date (YYYY-MM-DD):");
            if (!date) return;

            var paymentType = prompt("Enter Payment Type:");
            if (!paymentType) return;

            var confirmation = confirm("Please choose a file for proof.");
            if (!confirmation) return;

            // After confirmation, allow user to choose file
            document.getElementById("proof").click();
        }

        // Function to handle file selection
        function handleFileSelection(event) {
            var proof = event.target.files[0]; // Get the selected file
            if (!proof) {
                alert("Please select a file for proof.");
                return;
            }

            var amount = prompt("Enter Amount:");
            if (!amount) return;

            // You can now send this data to your backend for processing
            console.log("Product: " + document.getElementById("productName").value);
            console.log("Date: " + document.getElementById("date").value);
            console.log("Payment Type: " + document.getElementById("paymentType").value);
            console.log("Proof (File):", proof); // Log the file object
            console.log("Amount: " + amount);

            // Clear the form fields (optional)
            resetForm();
        }

        // Function to reset form
        function resetForm() {
            document.getElementById("expensesForm").reset();
        }
    </script>

    <form id="expensesForm" onsubmit="submitExpenses(); return false;">
        <label for="productName">Product:</label>
        <input type="text" id="productName" required><br><br>
        
        <label for="date">Date:</label>
        <input type="date" id="date" required><br><br>
        
        <label for="paymentType">Payment Type:</label>
        <input type="text" id="paymentType" required><br><br>
        
        <!-- Invisible file input field -->
        <input type="file" id="proof" accept="image/*, video/*, .pdf, .doc, .docx" style="display: none;" onchange="handleFileSelection(event)"><br><br>
        
        <label for="amount">Amount:</label>
        <input type="number" id="amount" required><br><br>
        
        <button type="submit">Submit</button>
    </form>
</body>
</html>
