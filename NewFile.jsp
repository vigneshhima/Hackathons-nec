<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter Job Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            max-width: 500px;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .error {
            color: yellow;
            margin-top: 5px;
            display: none;
        }
        .submit-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <h1>Enter Job Data</h1>
    <form id="jobForm">
        <div class="form-group">
            <label for="title">Title*</label>
            <input type="text" id="title" name="title">
            <div class="error" id="titleError">Title is required</div>
        </div>
        <div class="form-group">
            <label for="type">Type*</label>
            <select id="type" name="type">
                <option value="">Select type</option>
                <option value="Full-time">Full-time</option>
                <option value="Part-time">Part-time</option>
                <option value="Contract">Contract</option>
            </select>
            <div class="error" id="typeError">Type is required</div>
        </div>
        <div class="form-group">
            <label for="department">Department*</label>
            <select id="department" name="department">
                <option value="">Select department</option>
                <option value="Engineering">Engineering</option>
                <option value="Marketing">Marketing</option>
                <option value="Sales">Sales</option>
            </select>
            <div class="error" id="departmentError">Department is required</div>
        </div>
        <div class="form-group">
            <label for="country">Country*</label>
            <select id="country" name="country">
                <option value="">Select country</option>
                <option value="USA">USA</option>
                <option value="Canada">Canada</option>
                <option value="UK">UK</option>
            </select>
            <div class="error" id="countryError">Country is required</div>
        </div>
        <div class="form-group">
            <label for="description">Description*</label>
            <textarea id="description" name="description"></textarea>
            <div class="error" id="descriptionError">Description is required</div>
        </div>
        <div class="form-group">
            <label for="openingDate">Opening Date*</label>
            <input type="date" id="openingDate" name="openingDate">
            <div class="error" id="openingDateError">Valid opening date is required</div>
        </div>
        <button type="submit" class="submit-btn">Submit</button>
    </form>

    <script>
        document.getElementById('openingDate').valueAsDate = new Date(); // Fill current date

        document.getElementById('jobForm').addEventListener('submit', function(event) {
            var isValid = true;

            // Validate required fields
            ['title', 'type', 'department', 'country', 'description', 'openingDate'].forEach(function(field) {
                var element = document.getElementById(field);
                var errorElement = document.getElementById(field + 'Error');
                if (!element.value) {
                    errorElement.style.display = 'block';
                    isValid = false;
                } else {
                    errorElement.style.display = 'none';
                }
            });

            // Validate opening date
            var openingDateElement = document.getElementById('openingDate');
            var openingDateErrorElement = document.getElementById('openingDateError');
            var openingDateValue = new Date(openingDateElement.value);
            var currentDate = new Date();
            if (isNaN(openingDateValue) || openingDateValue > currentDate) {
                openingDateErrorElement.style.display = 'block';
                isValid = false;
            } else {
                openingDateErrorElement.style.display = 'none';
            }

            if (!isValid) {
                event.preventDefault();
            }
        });
    </script>

</body>
</html>
