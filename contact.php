<?php
require_once 'helpers/db-connect.php';
session_start();

$name = $email = $msg = '';
$errors = [];
if($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['submit'])) {
    if(isset($_POST['name']) && $_POST['name'] !== '') {
        $name = $_POST['name'];
        $m_name = $con->real_escape_string($name);
    } else array_push($errors, "Name must be provided");

    if(isset($_POST['email']) && $_POST['email'] !== '') {
        $email = $_POST['email'];
        $m_email = $con->real_escape_string($email);
    } else array_push($errors, "Email must be provided");

    if(isset($_POST['msg']) && $_POST['msg'] !== '') {
        $msg = $_POST['msg'];
        $m_msg = $con->real_escape_string($msg);
    } else array_push($errors, "Message must not be blank");

    $res = $con->query("SELECT id FROM messages WHERE name='$m_name' AND email='$m_email' AND message='$m_msg'");
    if($res->num_rows > 0) array_push($errors, "Looks like you had already sent the same message");

    if(empty($errors)) {
        $res = $con->query("INSERT INTO messages (name, email, message) VALUES ('$m_name', '$m_email', '$m_msg')");
        $_SESSION['msg'] = $res === TRUE ? "Message sent successfully!" : "Something went wrong. Please try again!";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="styles/main.css" />
    <?php require_once 'helpers/show-errors.php'; ?>
    <style>
        body{
            background-color: antiquewhite;
        }

      img{
        margin-left: auto;
        margin-right: auto;
        display: block;
      }
    </style>
</head>

<body>
    <div class="header">
        <table width="100%" class="header">
            <tr>
                <td align="right">

                        <h1 align="Center" style="color:white;" > CONTACT US </h1>
                        <img  src="images/logo.png" alt="sorry image not available!!" class="logo">


                    <a align="right" href="faq.html">FAQ'S</a>&nbsp;
                    <a align="right" href="./">BACK TO HOME</a>
                </td>
            </tr>
        </table>
    </div>
                <div>
                    <div style="padding: 10px 30px; text-align: center; background-color:black; color: white;">Help us improve your search experience.</div>
<span style="text-align:center; display:block; background-color:black; padding: 10px">
                     <a id='feedback' style="padding: 5px 30px; border-radius: 200px; background-color:white; center; color: black; border: 1px solid; font-size: 1.2em;" href="/majorproject/user/feedback.php">Feedback</a>
                </span>
                </div>
                <br>
    <center>
        <form class="formm" action="" method="POST">
            <div class="cntct">
                <p class="add">Address</p>
                Mayapuri, New Delhi, India
                <p class="add">E-mail</p>
                <a class="mail" href="mailto:">Letsscrapitt@gmail.com</a>
                <p class="add">Office Time</p>
                Mon To Sat <br>
                08:00 am - 08:00 pm <br>
                Sunday <br>
                Open 24 Hrs <br><br>
                <p class="add">Call us</p>
                93193-78XXX
            </div>
            <p id="whatt-info-heading">Send a message:-</p>
            <label for="name">NAME:</label>
            <input type="name" name="name" id="name" value="<?php echo htmlspecialchars($name); ?>" required>
            <br>
            <label for="email">EMAIL:</label>
            <input type="email" name="email" id="email" value="<?php echo htmlspecialchars($email); ?>" required>
            <br>
            <label for="msg">MESSAGE:</label>
            <textarea name="msg" id="msg" required><?php echo htmlspecialchars($msg); ?></textarea>
            <input type="submit" name="submit" value="SEND MESSAGE" class="bttn">
        </form>
    </center>
</body>

</html>
