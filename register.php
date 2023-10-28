<?php
require_once 'helpers/db-connect.php';
session_start();

if(isset($_SESSION['sy-uid'])) {
	header("Location: user/dashboard.php");
	exit;
}

$log_email = $reg_email = $fname = $lname = $pan = '';
$errors = [];
if($_SERVER['REQUEST_METHOD'] == "POST") {
    if(isset($_POST['login'])) {
        if(isset($_POST['email']) && $_POST['email'] !== '') {
            $log_email = $_POST['email'];
            $m_email = $con->real_escape_string($log_email);
        } else array_push($errors, "Email must be provided");

        if(!isset($_POST['pass']) || $_POST['pass'] === '') array_push($errors, "Password must be provided");

        if(empty($errors)) {
            $result = $con->query("SELECT id, password FROM users WHERE email='$m_email'");
            if($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                if(password_verify($_POST['pass'], $row['password'])) {
                    $_SESSION['sy-uid'] = $row['id'];
                    header("Location: user/dashboard.php");
                } else array_push($errors, "Incorrect password");
            } else array_push($errors, "You are not registered. Please register yourself first with the form below!");
        }
    } else if(isset($_POST['register'])) {
        if(isset($_POST['email']) && $_POST['email'] !== '') {
            $reg_email = $_POST['email'];
            $m_email = $con->real_escape_string($reg_email);
            $result = $con->query("SELECT id FROM users WHERE email='$m_email'");
            if($result->num_rows > 0) array_push($errors, "Email already registered. If this email is yours please login!");
        } else array_push($errors, "Email must be provided");

        if(!isset($_POST['pass']) || $_POST['pass'] === '') array_push($errors, "Password must be provided");
        else $m_pass = password_hash($_POST['pass'], PASSWORD_BCRYPT);

        if(isset($_POST['conf-pass']) && $_POST['conf-pass'] !== '') {
            if($_POST['pass'] !== $_POST['conf-pass']) array_push($errors, "Passwords do not match");
        } else array_push($errors, "Confirmation password must be provided");

        if(isset($_POST['fname'])) {
            $fname = $_POST['fname'];
            $m_fname = $con->real_escape_string($fname);
        } else array_push($errors, "First name must be provided");
        
        if(isset($_POST['lname'])) {
            $lname = $_POST['lname'];
            $m_lname = $con->real_escape_string($lname);
        } else array_push($errors, "Last name must be provided");

        if(isset($_POST['pan']) && $_POST['pan'] !== '') {
            $pan = strtoupper($_POST['pan']);
            if(strlen($pan) == 10) {
                $m_pan = $con->real_escape_string($pan);
                $res = $con->query("SELECT id FROM users WHERE pan='$m_pan'");
                if($res->num_rows > 0) array_push($errors, "A user with the same PAN number is already registered");
            } else array_push($errors, "PAN number must consist of 10 characters");
            $pattern = "/[A-Z]{5}[0-9]{4}[A-Z]+/";
            if(!preg_match($pattern, $pan)) array_push($errors, "PAN number must have 5 alphabets followed by 4 digits, again followed by 1 alphabet");
        } else array_push($errors, "PAN number must be provided");

        if(empty($errors)) {
            $res = $con->query("INSERT INTO users (email, password, first_name, last_name, pan) VALUES ('$m_email', '$m_pass', '$m_fname', '$m_lname', '$m_pan')");
            if($res === TRUE) $_SESSION['msg'] = "Registered successfully! Now login to access your account";
            else $_SESSION['msg'] = "Registration failed! Please try again later";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Register</title>
    <link rel="stylesheet" href="styles/main.css" />
    <?php require_once 'helpers/show-errors.php'; ?>
</head>

<body>
    <div class="header">
        <table width="100%" class="header">
            <tr>
                <h1>LOGIN / REGISTER</h1>
                <td align="right"> <a href="faq.html">FAQ'S</a>&nbsp; <a href="./">BACK TO HOME</a> </td>
            </tr>
        </table>
    </div><br>
    <center>
        <form class="formm" action="" method="POST">
            <p id="whatt-info-heading">Enter login details:-</p>
            <label for="email">EMAIL:</label>
            <input type="email" name="email" id="email" value="<?php echo htmlspecialchars($log_email) ?>" required>
            <br>
            <label for="pass">PASSWORD:</label>
            <input type="password" name="pass" id="pass" required><br>
            <a href="user/pass-reset">Forgot password?</a>
            <br>
            <input type="submit" name="login" value="LOGIN" class="bttn">
        </form>
        <br><br>
        <h1>OR</h1>
        <br><br>
        <form class="formm" action="" method="POST">
            <p id="whatt-info-heading">Register:-</p>
            <label for="fname">FIRST NAME:</label>
            <input type="text" name="fname" id="fname" required value="<?php echo htmlspecialchars($fname) ?>">
            <br>
            <label for="lname">LAST NAME:</label>
            <input type="text" name="lname" id="lname" required value="<?php echo htmlspecialchars($lname) ?>">
            <br>
            <label for="email">EMAIL:</label>
            <input type="email" name="email" id="email" value="<?php echo htmlspecialchars($reg_email) ?>" required>
            <br>
            <label for="pass">PASSWORD:</label>
            <input type="password" name="pass" id="pass" required>
            <br>
            <label for="conf-pass">CONFIRM PASSWORD:</label>
            <input type="password" name="conf-pass" id="conf-pass" required>
            <br>
            <label for="pan">PAN NUMBER:</label>
            <input type="text" name="pan" id="pan" value="<?php echo htmlspecialchars($pan) ?>" required size="10" maxlength="10">
            <br>
            <input type="submit" name="register" value="REGISTER" class="bttn">
        </form>
    </center>
</body>

</html>