<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Application Form</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Job Application Form</h1>
    <form id="jobApplicationForm">
        <label for="first_name">First Name:</label>
        <input type="text" id="first_name" name="first_name" required><br>

        <label for="last_name">Last Name:</label>
        <input type="text" id="last_name" name="last_name" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="phone">Phone Number:</label>
        <input type="text" id="phone" name="phone" required><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required><br>

        <label for="city">City:</label>
        <input type="text" id="city" name="city" required><br>

        <label for="state">State:</label>
        <input type="text" id="state" name="state" required><br>

        <label for="zip">Zip Code:</label>
        <input type="text" id="zip" name="zip" required><br>

        <label for="country">Country:</label>
        <select id="country" name="country" required>
            <option value="">Select Country</option>
            <option value="US">United States</option>
            <option value="CA">Canada</option>
            <!-- Add other countries as needed -->
        </select><br>

        <label for="edu_level">Education Level:</label>
        <select id="edu_level" name="edu_level" required>
            <option value="">Select Education Level</option>
            <option value="high_school">High School</option>
            <option value="bachelor">Bachelor's Degree</option>
            <option value="master">Master's Degree</option>
            <!-- Add other education levels as needed -->
        </select><br>

        <label for="edu_type">Education Type:</label>
        <select id="edu_type" name="edu_type" required>
            <option value="">Select Education Type</option>
            <option value="full_time">Full Time</option>
            <option value="part_time">Part Time</option>
            <!-- Add other education types as needed -->
        </select><br>

        <label for="resume">Resume:</label>
        <input type="file" id="resume" name="resume" required><br>

        <label for="cover_letter">Cover Letter:</label>
        <textarea id="cover_letter" name="cover_letter"></textarea><br>

        <label for="employed">Are you employed?</label>
        <input type="checkbox" id="employed" name="employed"><br>

        <div id="employmentDetails" style="display: none;">
            <label for="current_employer">Current Employer:</label>
            <input type="text" id="current_employer" name="current_employer"><br>

            <label for="years_of_exp">Years of Experience:</label>
            <input type="number" id="years_of_exp" name="years_of_exp"><br>
        </div>

        <label for="jobs">Jobs you want to apply for:</label>
        <select id="jobs" name="jobs" multiple required>
            <!-- Add job options dynamically or statically here -->
            <option value="job1">Job 1</option>
            <option value="job2">Job 2</option>
            <option value="job3">Job 3</option>
        </select><br>

        <button type="submit">Submit</button>
    </form>

    <script src="script.js"></script>
</body>
</html>
